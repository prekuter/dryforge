#!/usr/bin/env bash
# build.sh — regenerate every platform package from the canonical skill source.
#
#   src/skills/        canonical, platform-neutral skills (single source of truth)
#   platform/claude/   claude-only frontmatter values + plugin.json + LICENSE
#   platform/codex/    codex-only openai.yaml + plugin.json + LICENSE
#   platform/grok/     grok-only plugin.json + LICENSE
#   platform/agent-plugin/  Agent Plugins 1.0 plugin.json + LICENSE
#   README.md          repo-root README (+ README_KO.md) — GitHub landing only, NOT bundled into plugins
#   claude/            generated Claude plugin   (committed; Claude installs this)
#   codex/plugin/      generated Codex plugin    (committed; Codex installs this)
#   grok/              generated Grok plugin     (committed; Grok installs this)
#   agent-plugin/      generated Agent Plugin    (committed; Copilot installs this)
#
# Root marketplace manifests are committed repo files, not build outputs.
#
# Build-time guards:
#   ① shared references byte-identical (3 pairs)
#   ② frontmatter injection post-verified (a silent perl no-op must not ship)
#   ③ skill list discovered dynamically from src/skills/*/ (a 4th skill without
#     its claude_tools mapping or codex openai.yaml overlay fails the build)
#   ④ all plugin.json versions non-empty + identical + match CHANGELOG top

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT/src/skills"
PLAT="$ROOT/platform"
BUILD_TMP="$(mktemp -d "$ROOT/.build.XXXXXX")"
OUT="$BUILD_TMP/output"
mkdir -p "$OUT"
trap 'rm -rf "$BUILD_TMP"' EXIT

# ── guard ①: shared references byte-identical (pair list = the contract) ────
for pair in \
  "migration/references/harness-format.md:go/references/harness-format.md" \
  "migration/references/harness-review.md:go/references/harness-review.md" \
  "ready/references/foundation-format.md:go/references/foundation-format.md"; do
  a="$SRC/${pair%%:*}"; b="$SRC/${pair##*:}"
  if ! diff -q "$a" "$b" >/dev/null 2>&1; then
    echo "FAILED: shared reference drift: ${pair%%:*} != ${pair##*:}" >&2
    diff "$a" "$b" >&2 || true
    exit 1
  fi
done
echo "✓ shared references byte-identical (3 pairs)"

# ── guard ③: skills discovered dynamically from src ─────────────────────────
SKILLS=""
for d in "$SRC"/*/; do SKILLS="$SKILLS $(basename "$d")"; done
[ -n "$SKILLS" ] || { echo "FAILED: src/skills is empty" >&2; exit 1; }

# Per-skill allowed-tools for the Claude build. All three add Agent: ready dispatches the
# intent-completeness + 3-doc-gate subagents, go dispatches implementers/reviewers, and migration
# dispatches the final independent harness REVIEW subagent. bash 3.2 — no assoc arrays.
claude_tools() {
  case "$1" in
    migration|ready|go) echo "Read, Edit, Write, Bash, Grep, Glob, Agent, AskUserQuestion" ;;
  esac
}

# ── Claude → ./claude ───────────────────────────────────────────────────────
echo "=== build: claude ==="
mkdir -p "$OUT/claude/.claude-plugin"
cp -R "$SRC" "$OUT/claude/skills"
for s in $SKILLS; do
  TOOLS="$(claude_tools "$s")"
  [ -n "$TOOLS" ] || { echo "FAILED: missing Claude tool mapping for skill: $s" >&2; exit 1; }
  INJECT=$'disable-model-invocation: true\nallowed-tools: '"$TOOLS" \
    perl -0777 -i -pe 'BEGIN{$j=$ENV{INJECT}} s/\A(---\n.*?\n)---\n/$1$j\n---\n/s' \
    "$OUT/claude/skills/$s/SKILL.md"
done
# guard ②: assert the injection actually landed (perl substitution can no-op silently)
for s in $SKILLS; do
  f="$OUT/claude/skills/$s/SKILL.md"
  if ! grep -q '^disable-model-invocation: true$' "$f" || ! grep -q '^allowed-tools: ' "$f"; then
    echo "FAILED: Claude frontmatter injection failed for skill: $s" >&2
    exit 1
  fi
done
cp "$PLAT/claude/plugin.json" "$OUT/claude/.claude-plugin/plugin.json"
cp "$PLAT/claude/LICENSE" "$OUT/claude/"

# ── Codex → ./codex/plugin ──────────────────────────────────────────────────
echo "=== build: codex ==="
mkdir -p "$OUT/codex/plugin/.codex-plugin"
cp -R "$SRC" "$OUT/codex/plugin/skills"
cp -R "$PLAT/codex/skills/." "$OUT/codex/plugin/skills/"   # agents/openai.yaml overlay
# guard ③ (codex leg): every skill must carry its openai.yaml overlay
for s in $SKILLS; do
  [ -f "$OUT/codex/plugin/skills/$s/agents/openai.yaml" ] \
    || { echo "FAILED: missing Codex openai.yaml overlay for skill: $s" >&2; exit 1; }
done
cp "$PLAT/codex/plugin.json" "$OUT/codex/plugin/.codex-plugin/plugin.json"
cp "$PLAT/codex/LICENSE" "$OUT/codex/plugin/"

# ── Grok → ./grok ──────────────────────────────────────────────────────────
echo "=== build: grok ==="
mkdir -p "$OUT/grok"
cp -R "$SRC" "$OUT/grok/skills"
for s in $SKILLS; do
  INJECT=$'disable-model-invocation: true' \
    perl -0777 -i -pe 'BEGIN{$j=$ENV{INJECT}} s/\A(---\n.*?\n)---\n/$1$j\n---\n/s' \
    "$OUT/grok/skills/$s/SKILL.md"
done
cp "$PLAT/grok/plugin.json" "$OUT/grok/plugin.json"
cp "$PLAT/grok/LICENSE" "$OUT/grok/"

# ── Agent Plugins 1.0 → ./agent-plugin ─────────────────────────────────────
echo "=== build: agent-plugin ==="
mkdir -p "$OUT/agent-plugin"
cp -R "$SRC" "$OUT/agent-plugin/skills"
for s in $SKILLS; do
  INJECT=$'disable-model-invocation: true' \
    perl -0777 -i -pe 'BEGIN{$j=$ENV{INJECT}} s/\A(---\n.*?\n)---\n/$1$j\n---\n/s' \
    "$OUT/agent-plugin/skills/$s/SKILL.md"
done
cp "$PLAT/agent-plugin/plugin.json" "$OUT/agent-plugin/plugin.json"
cp "$PLAT/agent-plugin/LICENSE" "$OUT/agent-plugin/"

# guard ②: manual-only injection must land once in every Grok and Agent Plugin skill.
for target in grok agent-plugin; do
  for s in $SKILLS; do
    f="$OUT/$target/skills/$s/SKILL.md"
    if [ "$(grep -c '^disable-model-invocation: true$' "$f")" -ne 1 ]; then
      echo "FAILED: $target invocation policy injection failed for skill: $s" >&2
      exit 1
    fi
    if grep -q '^allowed-tools:' "$f"; then
      echo "FAILED: Claude allowed-tools leaked into $target skill: $s" >&2
      exit 1
    fi
  done
done

find "$OUT/claude" "$OUT/codex" "$OUT/grok" "$OUT/agent-plugin" \
  -name ".DS_Store" -delete 2>/dev/null || true

# ── guard ④: version consistency ────────────────────────────────────────────
# All 4 plugin.json carry the same non-empty version AND it matches the CHANGELOG
# top entry. Catches manual-edit skew at build time instead of leaving it for a
# human (or another agent) to spot. Release tags are validated separately so
# the build remains independent of Git state.
pj_ver() { perl -ne 'if(/"version"\s*:\s*"([^"]+)"/){print $1; last}' "$1"; }
VERS=""
for pj in "$PLAT/claude/plugin.json" "$PLAT/codex/plugin.json" \
          "$PLAT/grok/plugin.json" "$PLAT/agent-plugin/plugin.json" \
          "$OUT/claude/.claude-plugin/plugin.json" "$OUT/codex/plugin/.codex-plugin/plugin.json" \
          "$OUT/grok/plugin.json" "$OUT/agent-plugin/plugin.json"; do
  v="$(pj_ver "$pj")"
  [ -n "$v" ] || { echo "FAILED: empty version: $pj" >&2; exit 1; }
  VERS="$VERS$v"$'\n'
done
UNIQ="$(printf '%s' "$VERS" | sort -u)"
if [ "$(printf '%s\n' "$UNIQ" | grep -c .)" -ne 1 ]; then
  echo "✗ version mismatch across plugin.json:" >&2
  printf '%s' "$VERS" >&2
  exit 1
fi
CL_VER="$(perl -ne 'if(/^##\s+v([0-9][^\s(]*)/){print $1; last}' "$ROOT/CHANGELOG.md")"
if [ "$UNIQ" != "$CL_VER" ]; then
  echo "✗ plugin.json=v$UNIQ but CHANGELOG top=v$CL_VER" >&2
  exit 1
fi
echo "✓ version OK: v$UNIQ (8 manifests + CHANGELOG)"

# Publish only after every generated package and guard has succeeded. Existing outputs are
# retained inside BUILD_TMP until the full swap completes, so a failed move can be rolled back.
BACKUP="$BUILD_TMP/previous"
mkdir -p "$BACKUP/codex"
MOVED_OLD=""
for rel in claude codex/plugin grok agent-plugin; do
  if [ -e "$ROOT/$rel" ]; then
    mkdir -p "$(dirname "$BACKUP/$rel")"
    if ! mv "$ROOT/$rel" "$BACKUP/$rel"; then
      for restore in $MOVED_OLD; do
        mkdir -p "$(dirname "$ROOT/$restore")"
        mv "$BACKUP/$restore" "$ROOT/$restore"
      done
      echo "FAILED: could not stage existing output: $rel" >&2
      exit 1
    fi
    MOVED_OLD="$rel $MOVED_OLD"
  fi
done

MOVED_NEW=""
for rel in claude codex/plugin grok agent-plugin; do
  mkdir -p "$(dirname "$ROOT/$rel")"
  if ! mv "$OUT/$rel" "$ROOT/$rel"; then
    for rollback in $MOVED_NEW; do
      mkdir -p "$(dirname "$OUT/$rollback")"
      mv "$ROOT/$rollback" "$OUT/$rollback"
    done
    for restore in $MOVED_OLD; do
      mkdir -p "$(dirname "$ROOT/$restore")"
      mv "$BACKUP/$restore" "$ROOT/$restore"
    done
    echo "FAILED: could not publish generated output: $rel" >&2
    exit 1
  fi
  MOVED_NEW="$rel $MOVED_NEW"
done

echo "=== done → ./claude  ./codex/plugin  ./grok  ./agent-plugin ==="
