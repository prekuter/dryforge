<a id="top"></a>

<div align="center">

<p>
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="assets/readme/hero-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="assets/readme/hero-light.svg">
  <img alt="Dryforge — Your agent works like a senior developer. A bounded-autonomy plugin harness for coding agents. Intent to implementation: ready, then go." src="assets/readme/hero-light.svg" width="100%">
</picture>
</p>

<p>
<a href="https://github.com/prekuter/dryforge/actions/workflows/ci.yml"><img alt="CI" src="https://github.com/prekuter/dryforge/actions/workflows/ci.yml/badge.svg"></a>
&nbsp;&nbsp;
<a href="https://github.com/prekuter/dryforge/releases"><img alt="Release" src="https://img.shields.io/github/v/release/prekuter/dryforge?style=flat-square&label=release"></a>
&nbsp;&nbsp;
<a href="LICENSE"><img alt="License" src="https://img.shields.io/github/license/prekuter/dryforge?style=flat-square"></a>
&nbsp;&nbsp;
<a href="https://github.com/prekuter/dryforge/stargazers"><img alt="GitHub stars" src="https://img.shields.io/github/stars/prekuter/dryforge?style=flat-square&logo=github&label=stars"></a>
&nbsp;&nbsp;
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="assets/readme/supported-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="assets/readme/supported-light.svg">
  <img alt="Supported: Claude Code, Codex, Grok Build, GitHub Copilot, Antigravity" src="assets/readme/supported-light.svg">
</picture>
</p>

<p>
  <a href="#install-and-update">Install</a> ·
  <a href="#getting-started">Getting started</a> ·
  <a href="https://dryforge.dev">Website</a> ·
  <a href="./README_ko.md">한국어</a>
</p>

</div>

<a id="install-and-update"></a>

# Install & Update

<details>
<summary><b>Claude Code</b></summary>


Install:

```text
/plugin marketplace add prekuter/dryforge
/plugin install dryforge@dryforge
```


Update:

```text
/plugin marketplace update dryforge
/plugin update dryforge@dryforge
```


**Auto-update:** off by default. Turn it on in `/plugin` → Marketplaces → dryforge → Enable auto-update.


</details>

<details>
<summary><b>Codex</b></summary>


Install:

```text
codex plugin marketplace add prekuter/dryforge
codex plugin add dryforge@dryforge
```


Update:

```text
codex plugin marketplace upgrade dryforge
```


**Auto-update:** on. New releases load at the start of each session.


</details>

<details>
<summary><b>Grok Build</b></summary>


Install:

```text
grok plugin marketplace add prekuter/dryforge
grok plugin install dryforge
```


Update:

```text
grok plugin update dryforge
```


**Auto-update:** on. New releases load at the start of each session.


</details>

<details>
<summary><b>GitHub Copilot CLI</b></summary>


Install:

```text
copilot plugin marketplace add prekuter/dryforge
copilot plugin install dryforge@dryforge
```


Update:

```text
copilot plugin update dryforge
```


**Auto-update:** off by default. Add `"autoUpdate": true` to the dryforge entry under `extraKnownMarketplaces` in `~/.copilot/settings.json`.


</details>

<details>
<summary><b>Antigravity CLI</b></summary>


Install:

```text
agy plugin install https://github.com/prekuter/dryforge/tree/main/antigravity
```


Update:

```text
agy plugin install https://github.com/prekuter/dryforge/tree/main/antigravity
```


**Auto-update:** not available. Run the install command again to update.


</details>

<a id="the-problem"></a>

# Everyone has been using agents wrong.

Coding agents already know how to work. What they don't have is your intent.

The industry filled that gap with process. Workflows, methodologies, rules, swarms of agents — all fixed before anyone asks what you are building. The method comes first, and your intent is cut to fit it. Your intent should decide the method. Instead, the method decides your intent:

> *"We write tests first. Now — what are you building?"*

It runs backwards. Once the intent is clear, the method follows from it. Fixing the method first is not rigor. It only means no one listened first.

And every one of those rules was written before anyone saw your work, for whichever model was current when it was written. When the next model arrives, the rules no longer fit, and the whole setup is torn down and rebuilt. Again.

- **Workflows** script how the agent works, so every new model breaks them — and the model takes the blame.
- **Test-first as law** puts the same ceremony on a config file and a payment rule.
- **Subagent swarms** guess an unstated intent in parallel and bill the tokens as progress.
- **Loops** run for hours toward a goal nobody pinned down.
- **Questions** are a step in the procedure. They ask what the code already answers, while the decisions that are yours get made in silence. The most dangerous question is the one never asked.
- **Human checkpoints** land on every step of the process instead of on the decisions only you can make.
- **Spec documents** are generated for the ritual, then drift from the code and stop being read.

The problem nobody solved is the first one: understanding what you actually mean.

<a id="approach"></a>

# Fundamentally Different Approach

Agents have become capable enough to be given real autonomy. The question is no longer whether to let them decide. It is what they may decide.

There have been two answers, and both are wrong.

- **Hold the agent too tight**, and you get process: every step scripted, every case enumerated in advance. It props up a weak model and caps a strong one. The better the model gets, the more the procedure holds it back.
- **Let the agent go**, and you get a bare agent: free where it should be free, and free where it should not be. It decides what you meant, and fills every gap with a plausible guess.

Dryforge's answer is the third: bounded autonomy, anchored in your intent. The agent has full freedom inside a boundary it may not move on its own — and that boundary is your intent.

**Agents rarely fail for lack of intelligence.** Most of their failures are failures of authority, dressed up as failures of reasoning. An agent infers a product rule no one stated. It treats the code that exists as proof of what was intended. It reinterprets a requirement into something easier to build. It takes its own summary as proof that the work is done. Each step sounds reasonable on its own. Together, they carry the result away from what you wanted.

**So Dryforge separates authority.** On top of bounded autonomy, Dryforge built its own authority model:

- Every decision in the work has an owner. What is yours comes back to you, whatever form it takes. What is the agent's, the agent decides with everything it has.
- What can be found out is not asked. What is yours is never guessed.
- When sources disagree, nothing is chosen quietly. The conflict comes to you.
- No process decides what is yours, and nothing that is yours is decided without you. A guess is worse than a pause.

**The rest of the design follows from it.**

- **A floor, not a ceiling.** Dryforge fixes only what must hold, and leaves the reasoning open. A better model raises the ceiling by itself.
- **Trust the reasoning, not the self-verdict.** The agent's judgment is trusted. Its judgment of its own work is not. Whether something is done is decided by evidence, not by the agent's word.
- **Effort in proportion.** Effort scales with the risk of the work. A small change stays small; a risky one gets the rigor it needs. Thoroughness for show is a failure, not a virtue.
- **Protect the goal, not a proxy.** Every rule, checklist, and gate a harness adds can become the thing the agent optimizes instead of the work. Dryforge adds none of them for their own sake. It arranges the work so that the shortest path is the one that serves your intent.

**It changes where you stand.** You are not asked to supervise every step, approve every stage, or answer what the code could have told the agent. You are called in where the decision is yours, and only there. You stay the author of what gets built, and you know why it is the way it is.

Because the boundary does not move, everything inside it can run at full strength.

<a id="dryforge"></a>

# Definition of Dryforge

Dryforge carries your intent from the first question to proven work, and never loses it on the way.

It is not a bundle of spec-first, test-first, and parallel-agent rituals. Everything in it follows from one principle: whose decision it is.

## Intent, understood

This is where Dryforge begins, and where it breaks from everything else.

It reads what you bring as material, not orders. A detailed document is not assumed right because it is detailed, and a rough one is no excuse to guess. Nothing you said is quietly rewritten into something you didn't mean.

Most tools then ask the way a form does — a fixed list, one field at a time, in the order the procedure needs — or they don't ask at all, and guess. Dryforge asks the way a senior engineer does, after reading everything first.

The more it understands what you are trying to do, the less it needs to ask. Whatever you have already made clear — in your words, your material, or your code — it settles on its own, and does not ask again.

Most of what matters is never said. So it thinks through the parts you never mentioned, and asks only what is yours to decide — because the decision belongs to you, not because a procedure has a step for questions.

- Questions about what you want go straight to you.
- When a decision is yours but technical, it comes with options and a recommendation, so you can decide without being an engineer.
- The thinner your input, the deeper it asks. A one-line idea does not get a one-line design.

Nothing that is yours is decided in silence. Defaults you may want to change later are marked for you before you approve.

You answer only the questions that are yours, and every one of them matters. The conversation ends; the intent does not. It is written down to stand on its own, without the conversation behind it.

## Intent, realized

What you approved is carried out as you meant it — not traded for an easier version, and not left at code that merely runs. If reality pushes back along the way, Dryforge does not bend your intent to fit. It comes back to you.

The work gets as much structure as it needs, and no more. Tests, parallel work, isolation, independent review: all there, used when the work calls for them, never as ceremony. No agents are spun up just to look busy.

Done means verified — by checks that actually ran. A check that could not run is a failure, not a pass.

What goes back into your project reflects both what you decided and what was actually built.

## Intent, kept

What was decided, and why, stays in your project. Each turn of the loop starts from everything the last one settled, so the questions get sharper and fewer as the project grows. The longer you use it, the better it knows your project.

It is kept as plain documents in your repository, not inside a tool. Switch agents, and your project comes with you.

It attaches to the agent you already use and is not tuned to any model. One skill source runs on Claude Code, Codex, Grok Build, GitHub Copilot CLI, and Antigravity CLI; adding an agent took packaging alone.

<a id="getting-started"></a>

# Getting Started

## Commands

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="assets/readme/loop-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="assets/readme/loop-light.svg">
  <img alt="New project: ready. Existing codebase: migration once. Then ready and go, in a loop, with what stays in your project." src="assets/readme/loop-light.svg" width="100%">
</picture>

Start a new project with `ready`. Bring an existing codebase in with `migration`, once. From then on, `ready` and `go` are the whole loop — no workflow to learn, nothing to configure. Two moments are always yours: approving your intent before anything is built, and accepting the result.

It works in whatever language you write in, and between a question and a result it stays quiet. Use it where a wrong assumption would be expensive: new projects, features, changes that cross the codebase. A small, already-clear edit doesn't need it.

Use `/ready`, `/go`, and `/migration`. In Codex, the prefix is `$`: `$ready`, `$go`, `$migration`.

### ready

```text
/ready <anything>
```

Bring whatever you have — a one-line idea, a brainstorm, a vague spec, a PDF, a plan another tool wrote, or all of it at once. No need to clean up your thinking or fit it into a format.

ready reads your project, works out what you mean, and asks only what it needs from you. When every open decision is settled, it hands you the result to approve: your intent, drafted in plain Markdown under `.dryforge/` on your machine. Nothing is built until you approve it. Then run `go` in the same session. If the session ends first, `/go` picks up the approved intent from `.dryforge/` in a new one.

No repository yet? ready offers to set one up.

### go

```text
/go
```

It realizes what you approved and verifies it. It speaks up only for results and real blockers — and if the work would change what you asked for, it stops and asks. When the work is done, it reports the result and what changed in your project docs.

Your repository stays yours. A new project is built directly on main. On an existing project the work happens on its own branch, and when it is done, go asks how you want it integrated — merge, pull request, or leave it as it is. It never merges on its own.

### migration

```text
/migration
```

Code shows what was built, not what was meant. It can prove that an authorization check exists; it cannot prove that the check is the whole policy.

migration reads your codebase and works out what it can on its own. Then it asks about what code cannot tell it — the business rules, the security policy, which parts are intentional and which are just history. Existing docs are weighed, not trusted, and it tells you what it kept, what it dropped, and why.

It writes your project's documentation and leaves the commit to you. If you already have CLAUDE.md or AGENTS.md, it reviews them with you, backs them up, and rewrites them with your approval. Run it once, commit, and start a fresh session. From then on, the project lives in the `ready` → `go` loop.

## What stays in your project

```text
your-project/
├── CLAUDE.md                 # read first by Claude Code
├── AGENTS.md                 # read first by Codex and other agents
├── docs/
│   ├── architecture.md       # how the system fits together
│   ├── business-rules.md     # how the product must behave
│   ├── security.md           # who may do what, and what is protected
│   ├── standards.md          # the rules that must not break
│   ├── engineering-notes.md  # traps and non-obvious mechanisms
│   ├── operations.md         # setup, build, deploy
│   ├── contracts.md          # what goes in and out
│   └── tracking/             # where the project stands, and the decisions behind it
└── <module>/AGENTS.md        # local rules for each part of the codebase
```

Each turn of the loop leaves your project's intent written down — the decisions, the reasons, the rules the code can't show. Only what matters stays. Each run keeps what it touches in step with the code, so it sharpens instead of piling up. The next `ready` starts from it.

It is plain Markdown, written in the language you work in, at the entry points coding agents already read. The documents describe your project, not Dryforge. Any agent, in any session, works from them — with or without Dryforge. Remove the plugin and they stay.

Dryforge runs only when you call it. What it leaves behind keeps working.

The working record of each task stays under `.dryforge/`, local to your machine. What matters moves into `docs/` and goes into your repository with the rest of your work.

# Requirements

> [!IMPORTANT]
> Git is required. Before `go` runs, the working tree must be clean — no uncommitted or untracked files outside `.dryforge/` — and if your main branch tracks a remote, it must have no unpushed commits.

# License

[Apache License 2.0](LICENSE) (`Apache-2.0`).

<br />

<div align="center">

<img src="https://dryforge.dev/logo-mark.svg" width="40" height="40" alt="Dryforge">

<sub><a href="#top">back to top</a> · <a href="https://dryforge.dev">dryforge.dev</a> · © 2026 prekuter · Apache-2.0</sub>

</div>
