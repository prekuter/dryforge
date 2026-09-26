<a id="top"></a>

<div align="center">

<p>
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="assets/readme/hero-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="assets/readme/hero-light.svg">
  <img alt="Dryforge: Intent to implementation: ready, then go." src="assets/readme/hero-light.svg" width="100%">
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
  <a href="#install-and-update">安装</a> ·
  <a href="#getting-started">开始使用</a> ·
  <a href="https://dryforge.dev">网站</a> ·
  <a href="./README.md">English</a> ·
  <a href="./README_ko.md">한국어</a> ·
  <a href="./README_ja.md">日本語</a>
</p>

</div>

<a id="install-and-update"></a>

# 安装与更新

<details>
<summary><b>Claude Code</b></summary>


安装：

```text
/plugin marketplace add prekuter/dryforge
/plugin install dryforge@dryforge
```


更新：

```text
/plugin marketplace update dryforge
/plugin update dryforge@dryforge
```


**自动更新：** 默认关闭。可在 `/plugin` → Marketplaces → dryforge → Enable auto-update 中开启。


</details>

<details>
<summary><b>Codex</b></summary>


安装：

```text
codex plugin marketplace add prekuter/dryforge
codex plugin add dryforge@dryforge
```


更新：

```text
codex plugin marketplace upgrade dryforge
```


**自动更新：** 已开启。每次会话开始时加载新版本。


</details>

<details>
<summary><b>Grok Build</b></summary>


安装：

```text
grok plugin marketplace add prekuter/dryforge
grok plugin install dryforge
```


更新：

```text
grok plugin update dryforge
```


**自动更新：** 已开启。每次会话开始时加载新版本。


</details>

<details>
<summary><b>GitHub Copilot CLI</b></summary>


安装：

```text
copilot plugin marketplace add prekuter/dryforge
copilot plugin install dryforge@dryforge
```


更新：

```text
copilot plugin update dryforge
```


**自动更新：** 默认关闭。在 `~/.copilot/settings.json` 的 `extraKnownMarketplaces` 下，给 dryforge 条目加上 `"autoUpdate": true` 即可开启。


</details>

<details>
<summary><b>Antigravity CLI</b></summary>


安装：

```text
agy plugin install https://github.com/prekuter/dryforge/tree/main/antigravity
```


更新：

```text
agy plugin install https://github.com/prekuter/dryforge/tree/main/antigravity
```


**自动更新：** 不支持。重新运行安装命令即可更新。


</details>

<a id="the-problem"></a>

# Agent，你一直都用错了。

Agent 早就会干活了。它缺的是你的意图。

行业用流程填补了这个空缺。工作流、方法论、规则、一堆并行 Agent，在有人问你要做什么之前，就已经全部定好了。方法先行，意图只能削足适履。

**本该由意图决定方法，现在却是方法决定意图。**

> *"我们先写测试。那么，你要做什么？"*

顺序反了。意图一旦清楚，方法自然随之而来。先定方法不叫严谨，只说明没人先听你说。

而且这些规则都是在看到你的工作之前，照着当时的模型写的。新模型一出，规则就不合适了，整套配置推倒重来。下一个模型出来，再推倒一次。

- **工作流**把 Agent 的每一步都写死，每换一代模型就失效，锅却由模型来背。
- **教条式的 TDD** 让一行配置和支付逻辑走同一套流程。
- **多余的 subagent** 各自猜测没说出口的意图，再把烧掉的 token 算作进度。
- **Loop** 朝着没人定下的目标，一跑就是几个小时。
- **提问**只是流程里的一个步骤。代码里已有答案的照样问，真正该由你做的决定却被悄悄定了。最危险的问题，是从来没被问出来的那个。
- **人工确认**卡在流程的每一步，而不是只卡在只有你才能做的决定上。
- **Spec 文档**为了走流程而生成，很快和代码脱节，最后没人再看。

没人解决的，恰恰是最开始的那个问题：弄懂你真正想要什么。

<a id="approach"></a>

# 从根本上不同的思路

Agent 已经强到可以真正放手了。问题不再是放不放手，而是放到哪一步。

到目前为止有两种答案，都错了。

- **管得太死**，就成了流程：每一步都写好脚本，每种情况都预先列出。能扶住弱模型，却会束缚强模型。模型越好，流程越碍事。
- **完全放开**，就是一个裸 Agent：该自由的地方自由，不该自由的地方也自由。连你想要什么都自己拿主意，没人定下的地方就用看似合理的猜测补上。

Dryforge 给出第三种答案：以你的意图为边界的 bounded autonomy。Agent 在边界内完全自由，但边界本身它不能擅自移动。这条边界，就是你的意图。

**Agent 很少因为不够聪明而失败。** 大多数失败看起来是推理错误，实际上是权限问题。它会猜测没人说过的产品规则，把现有代码当成原本的意图，把需求改读成更容易实现的样子，拿自己写的总结当作完成的证据。每一步单看都说得通，叠在一起，结果就离你想要的越来越远。

**所以 Dryforge 把权限分开了。** 在 bounded autonomy 之上，Dryforge 建立了自己的权限模型：

- 工作中的每个决定都有归属。属于你的决定，无论以什么形式出现，都会回到你手上。属于 Agent 的决定，Agent 会用尽手头的一切去做。
- 能查到的不问，属于你的决定绝不去猜。
- 信息来源互相矛盾时，不会悄悄挑一个，而是把冲突交给你。
- 任何流程都不能替你做决定，属于你的决定也不会在你缺席时做出。与其猜，不如停下来。

**其余的设计都由此而来。**

- **只定下限，不设上限。** 只固定必须守住的东西，推理保持开放。上限交给更好的模型自己抬高。
- **信任推理，不信任自我评判。** 相信 Agent 的判断，但不让它给自己的工作打分。做没做完由证据说了算，而不是 Agent 的一句话。
- **投入与风险相称。** 小改动轻做，高风险的改动该多严谨就多严谨。做给人看的周全不是美德，而是失败。
- **守住目标，而不是代理指标。** harness 加上的规则、检查清单、关卡，很容易变成 Agent 的优化对象。Dryforge 不为加而加，而是让最短的路径正好通向你的意图。

**你的位置变了。** 不必盯着每一步、批准每个阶段，也不必替代码回答它本可以告诉 Agent 的事。只有需要你做决定的地方才会叫你，也只在那里。做出来的东西，作者始终是你，你也清楚它为什么是现在这个样子。

边界不动，边界之内的一切才能全速运转。

<a id="dryforge"></a>

# Dryforge 是什么

从第一个问题到经过验证的结果，Dryforge 一路带着你的意图，从不丢失。

它不是 spec-driven、TDD、并行 Agent 这些惯例的打包。它的一切都来自一个原则：这个决定归谁。

## Intent, understood

Dryforge 从这里开始，也从这里和其他工具分道扬镳。

你带来的东西，它当作素材来读，而不是指令。写得详细的文档不会因此被默认正确，潦草的笔记也不会成为瞎猜的借口。你说的话，不会被悄悄改成你没想表达的意思。

多数工具接下来会像填表一样提问：按流程的顺序，把固定清单一项一项问下去，或者干脆不问，直接猜。Dryforge 先把一切读完，只问需要判断的地方。

越理解你要做的事，问得就越少。你的话、你给的资料、代码里已经说清楚的，它自己整理，不再重复问。

真正重要的东西，大多没人说出口。所以它会把你没提到的部分也想一遍，只问该由你决定的事。不是因为流程里有提问这一步，而是因为那个决定属于你。

- 关于需求的问题，直接交给你。
- 决定属于你但偏技术时，会附上选项和推荐，不是工程师也能选。
- 你给的信息越少，它问得越深。一句话的想法，换不来一句话的设计。

属于你的决定，不会被悄悄定下。以后可能想改的默认值，会在批准前单独标出来。

你只回答属于你的问题，每一个都很重要。对话会结束，意图不会。它会写成文档，脱离对话也能看懂。

## Intent, realized

你批准的内容，会按你的本意实现。不会换成更容易的版本，也不会停在能跑就行的代码上。途中遇到和计划不符的情况，Dryforge 不会扭曲意图去迁就，而是回来问你。

结构只加到工作需要的程度。测试、并行、隔离、独立 review 都有，只在工作需要时使用，从不走过场。不会为了显得忙碌而启动 Agent。

完成就意味着经过验证，而且验证必须真正跑过。没能跑起来的验证不是通过，而是失败。

写回项目的内容，同时反映你的决定和实际做出来的东西。

## Intent, kept

决定了什么、为什么这样决定，都会留在项目里。每一轮 loop 都从上一轮整理好的一切出发，项目越大，问题越精准、越少。用得越久，它越了解你的项目。

这些记录不在工具里，而是以普通文档的形式留在你的仓库中。换一个 Agent，项目照样跟着走。

它直接接入你正在用的 Agent，不针对任何特定模型。同一份 skill 源码在所有支持的 Agent 上运行，新增一个 Agent 只需要打包。

<a id="getting-started"></a>

# 开始使用

## 命令

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="assets/readme/loop-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="assets/readme/loop-light.svg">
  <img alt="新项目从 ready 开始，已有代码库用 migration 迁移一次。之后在 ready 和 go 之间循环，延续项目里留下的记录。" src="assets/readme/loop-light.svg" width="100%">
</picture>

新项目用 `ready` 开始，已有代码库用 `migration` 迁移一次。之后，`ready` 和 `go` 就是全部。没有要学的工作流，也没有要配置的东西。有两个时刻始终属于你：动手之前批准意图，以及接受结果。

你用什么语言写，它就用什么语言工作；从提问到给出结果之间，它不会打扰你。适合用在假设一旦出错代价很高的地方：新项目、新功能、横跨整个代码库的改动。小而明确的修改用不着它。

用 `/ready`、`/go`、`/migration` 调用。在 Codex 中前缀是 `$`：`$ready`、`$go`、`$migration`。

### ready

```text
/ready <anything>
```

有什么就带什么来：一句话的想法、头脑风暴、模糊的 spec、PDF、别的工具写的计划，或者全部一起。不用先理清思路，也不用套格式。

ready 会读你的项目，弄清你的意思，只问它需要你回答的问题。所有待定的决定都理清后，它会交给你一份待批准的结果：用普通 Markdown 写在 `.dryforge/` 下的意图，只保存在本地。批准之前，什么都不会动手做。批准后，在同一个会话里运行 `go`。如果会话先结束了，新会话里的 `/go` 会从 `.dryforge/` 接上已批准的意图。

还没有仓库？ready 会提议帮你建一个。

### go

```text
/go
```

go 会实现你批准的内容并加以验证。只在有结果或遇到真正的 blocker 时才开口；如果工作会改变你的要求，它会停下来问你。完成后，它会报告结果，以及项目文档里改了什么。

仓库始终属于你。新项目直接在 main 上构建。已有项目在单独的分支上工作，完成后 go 会问你想怎么合并：merge、pull request，或者保持原样。它从不自己 merge。

### migration

```text
/migration
```

代码只说明做出了什么，说明不了本意是什么。它能证明存在权限检查，却证明不了这个检查就是完整的策略。

migration 会读你的代码库，先弄清自己能弄清的部分。然后询问代码说明不了的东西：业务规则、安全策略、哪些是有意为之、哪些只是历史遗留。已有文档不会被直接采信，而是逐一审视，并告诉你保留了什么、丢弃了什么、为什么。

项目文档由 migration 来写，commit 交给你。如果已经有 CLAUDE.md 或 AGENTS.md，它会和你一起审查、先备份，再经你批准后重写。运行一次、commit、开一个新会话。从此，项目就在 `ready` → `go` 的 loop 里运转。

## 项目里留下什么

```text
your-project/
├── AGENTS.md / CLAUDE.md     # 每个 Agent 最先读取的文件
├── docs/
│   ├── architecture.md       # 系统结构
│   ├── business-rules.md     # 产品必须遵守的行为
│   ├── security.md           # 权限与保护对象
│   ├── standards.md          # 不能违反的规则
│   ├── engineering-notes.md  # 陷阱，以及只看代码看不出的机制
│   ├── operations.md         # 安装、构建、部署
│   ├── contracts.md          # 输入输出约定
│   └── tracking/             # 项目进展和背后的决定
└── <module>/AGENTS.md        # 各模块的规则
```

每一轮 loop 都会把项目的意图记录下来：决定、理由、代码里看不出来的规则，只留下重要的。每次运行都会让改动过的部分与代码保持一致，所以记录越积越清晰，而不是越堆越多。下一次 `ready` 就从这里开始。

它是普通的 Markdown，用你工作时的语言书写，放在 Agent 本来就会读取的入口位置。文档描述的是你的项目，而不是 Dryforge。无论哪个 Agent、哪个会话，有没有 Dryforge，都能照着这些文档工作。卸载插件，文档依然还在。

Dryforge 只在你调用时运行，它留下的东西会一直起作用。

每项任务的工作记录保存在 `.dryforge/` 下，只在本地。重要的内容会移到 `docs/`，和其他工作成果一起进入仓库。

# 要求

> [!IMPORTANT]
> 需要 Git。运行 `go` 之前，工作区必须是干净的：`.dryforge/` 之外不能有未提交或未跟踪的文件；如果 main 分支跟踪了远程，也不能有未推送的提交。

# 许可证

[Apache License 2.0](LICENSE)（`Apache-2.0`）。

<br />

<div align="center">

<img src="https://dryforge.dev/logo-mark.svg" width="40" height="40" alt="Dryforge">

<sub><a href="#top">back to top</a> · <a href="https://dryforge.dev">dryforge.dev</a> · © 2026 prekuter · Apache-2.0</sub>

</div>
