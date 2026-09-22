#!/usr/bin/env python3
"""Verify that the repository is internally consistent and reproducible."""

from __future__ import annotations

import argparse
import json
import re
import subprocess
import sys
from pathlib import Path


class VerificationError(RuntimeError):
    pass


def run(command: list[str], cwd: Path, *, capture: bool = False) -> str:
    result = subprocess.run(
        command,
        cwd=cwd,
        check=False,
        text=True,
        stdout=subprocess.PIPE if capture else None,
        stderr=subprocess.PIPE if capture else None,
    )
    if result.returncode != 0:
        detail = (result.stdout or "") + (result.stderr or "")
        raise VerificationError(
            f"command failed ({' '.join(command)})" + (f"\n{detail.strip()}" if detail.strip() else "")
        )
    return (result.stdout or "").strip()


def load_json(path: Path) -> dict:
    try:
        value = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        raise VerificationError(f"invalid JSON: {path}: {exc}") from exc
    if not isinstance(value, dict):
        raise VerificationError(f"JSON root must be an object: {path}")
    return value


def changelog_version(root: Path) -> str:
    match = re.search(r"^##\s+v([^\s(]+)", (root / "CHANGELOG.md").read_text(encoding="utf-8"), re.MULTILINE)
    if not match:
        raise VerificationError("CHANGELOG.md has no version heading")
    return match.group(1)


def manifest_versions(root: Path) -> dict[Path, str]:
    manifests = sorted(root.glob("**/plugin.json"))
    if not manifests:
        raise VerificationError("no plugin.json manifests found")
    versions: dict[Path, str] = {}
    for path in manifests:
        data = load_json(path)
        version = data.get("version")
        if not isinstance(version, str) or not version.strip():
            raise VerificationError(f"missing version: {path.relative_to(root)}")
        versions[path.relative_to(root)] = version
    return versions


def validate_json_files(root: Path) -> None:
    candidates = set(root.glob("**/plugin.json")) | set(root.glob("**/marketplace.json"))
    for path in sorted(candidates):
        load_json(path)
    print(f"OK JSON manifests ({len(candidates)})")


def validate_versions(root: Path, tag: str | None) -> None:
    versions = manifest_versions(root)
    unique = set(versions.values())
    if len(unique) != 1:
        detail = "\n".join(f"  {path}: {version}" for path, version in versions.items())
        raise VerificationError(f"manifest version mismatch:\n{detail}")
    version = unique.pop()
    changelog = changelog_version(root)
    if version != changelog:
        raise VerificationError(f"manifest version {version} != CHANGELOG version {changelog}")
    if tag is not None:
        if not re.fullmatch(r"v[0-9]+\.[0-9]+\.[0-9]+", tag):
            raise VerificationError(f"release tag must be vX.Y.Z: {tag}")
        if tag != f"v{version}":
            raise VerificationError(f"tag {tag} != manifest version v{version}")
    print(f"OK version {version}" + (f" and tag {tag}" if tag else ""))


def git_diff(root: Path) -> str:
    top = Path(run(["git", "rev-parse", "--show-toplevel"], root, capture=True)).resolve()
    relative = root.resolve().relative_to(top)
    pathspec = "." if relative == Path(".") else relative.as_posix()
    return run(["git", "diff", "--", pathspec], top, capture=True)


def validate_reproducible_build(root: Path) -> None:
    before = git_diff(root)
    if before:
        raise VerificationError("verification requires a clean tracked tree")
    run(["bash", "-n", "build/build.sh"], root)
    run(["bash", "build/build.sh"], root)
    after = git_diff(root)
    if after:
        raise VerificationError(f"generated outputs are stale:\n{after}")
    print("OK reproducible build")


def verify(root: Path, tag: str | None = None) -> None:
    required = [
        "CHANGELOG.md",
        "build/build.sh",
        "src/skills",
        "platform/claude/plugin.json",
        "platform/codex/plugin.json",
    ]
    missing = [item for item in required if not (root / item).exists()]
    if missing:
        raise VerificationError(f"missing required paths: {', '.join(missing)}")
    validate_json_files(root)
    validate_versions(root, tag)
    validate_reproducible_build(root)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument("--tag", help="Validate a release tag such as v1.2.0")
    args = parser.parse_args()
    try:
        verify(args.root.resolve(), args.tag)
    except (VerificationError, OSError, ValueError) as exc:
        print(f"FAILED: {exc}", file=sys.stderr)
        return 1
    print("Repository verification passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
