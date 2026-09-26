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
  <a href="#install-and-update">설치</a> ·
  <a href="#getting-started">시작하기</a> ·
  <a href="https://dryforge.dev">웹사이트</a> ·
  <a href="./README.md">English</a> ·
  <a href="./README_zh.md">中文</a> ·
  <a href="./README_ja.md">日本語</a>
</p>

</div>

<a id="install-and-update"></a>

# 설치 & 업데이트

<details>
<summary><b>Claude Code</b></summary>


설치:

```text
/plugin marketplace add prekuter/dryforge
/plugin install dryforge@dryforge
```


업데이트:

```text
/plugin marketplace update dryforge
/plugin update dryforge@dryforge
```


**자동 업데이트:** 기본은 꺼져 있습니다. `/plugin` → Marketplaces → dryforge → Enable auto-update에서 켤 수 있습니다.


</details>

<details>
<summary><b>Codex</b></summary>


설치:

```text
codex plugin marketplace add prekuter/dryforge
codex plugin add dryforge@dryforge
```


업데이트:

```text
codex plugin marketplace upgrade dryforge
```


**자동 업데이트:** 켜져 있습니다. 세션을 시작할 때 새 릴리스를 불러옵니다.


</details>

<details>
<summary><b>Grok Build</b></summary>


설치:

```text
grok plugin marketplace add prekuter/dryforge
grok plugin install dryforge
```


업데이트:

```text
grok plugin update dryforge
```


**자동 업데이트:** 켜져 있습니다. 세션을 시작할 때 새 릴리스를 불러옵니다.


</details>

<details>
<summary><b>GitHub Copilot CLI</b></summary>


설치:

```text
copilot plugin marketplace add prekuter/dryforge
copilot plugin install dryforge@dryforge
```


업데이트:

```text
copilot plugin update dryforge
```


**자동 업데이트:** 기본은 꺼져 있습니다. `~/.copilot/settings.json`의 `extraKnownMarketplaces` 아래 dryforge 항목에 `"autoUpdate": true`를 넣으면 켜집니다.


</details>

<details>
<summary><b>Antigravity CLI</b></summary>


설치:

```text
agy plugin install https://github.com/prekuter/dryforge/tree/main/antigravity
```


업데이트:

```text
agy plugin install https://github.com/prekuter/dryforge/tree/main/antigravity
```


**자동 업데이트:** 지원하지 않습니다. 같은 설치 명령을 다시 실행하면 업데이트됩니다.


</details>

<a id="the-problem"></a>

# 에이전트, 잘못 쓰고 계셨습니다.

에이전트는 이미 일할 줄 압니다. 모르는 건 사용자의 의도입니다.

업계는 그 빈자리를 프로세스로 채웠습니다. 워크플로, 방법론, 규칙, 병렬 에이전트까지, 무엇을 만드는지 묻기도 전에 이미 다 정해져 있습니다. 방법이 먼저고, 의도는 거기에 끼워 맞춥니다.

**의도가 방법을 정해야 하는데, 지금은 방법이 의도를 정합니다.**

> *"테스트부터 짤게요. 그런데 뭘 만드시려고요?"*

순서가 거꾸로입니다. 의도가 분명하면 방법은 따라 나옵니다. 방법부터 정하는 건 꼼꼼함이 아닙니다. 아무도 먼저 듣지 않았다는 뜻일 뿐입니다.

게다가 이런 규칙은 일을 보기도 전에, 그 시점의 모델에 맞춰 쓰였습니다. 새 모델이 나오면 맞지 않아서 전부 뜯어고치고, 다음 모델이 나오면 또 뜯어고칩니다.

- **워크플로**는 에이전트가 일하는 순서를 미리 짜 둡니다. 새 모델이 나올 때마다 어긋나는데, 탓은 모델이 듣습니다.
- **무조건적인 TDD**는 설정 파일 한 줄에도, 결제 로직에도 같은 절차를 요구합니다.
- **불필요한 서브에이전트**는 저마다 말하지 않은 의도를 짐작하고, 그렇게 태운 토큰을 진척이라고 부릅니다.
- **루프**는 아무도 정하지 않은 목표를 향해 몇 시간씩 돌아갑니다.
- **질문**은 절차에 들어 있으니까 할 뿐입니다. 코드를 보면 알 수 있는 건 묻고, 정작 사용자가 정해야 할 건 알아서 정해 버립니다. 가장 위험한 건 끝내 나오지 않은 질문입니다.
- **사람 확인** 단계는 사용자만 내릴 수 있는 결정이 아니라 절차의 모든 단계에 끼어 있습니다.
- **스펙 문서**는 절차니까 만들고, 코드와 금방 어긋나고, 결국 아무도 읽지 않습니다.

정작 아무도 풀지 않은 건 맨 처음 문제, 사용자가 실제로 무엇을 원하는지 이해하는 일입니다.

<a id="approach"></a>

# 근본적으로 다른 접근

에이전트는 정말로 일을 맡겨도 될 만큼 똑똑해졌습니다. 이제 문제는 맡길지 말지가 아니라 어디까지 맡길지입니다.

지금까지 나온 답은 둘이었고, 둘 다 틀렸습니다.

- **너무 조이면** 프로세스가 됩니다. 단계마다 할 일을 정하고, 경우의 수를 미리 다 적어 둡니다. 약한 모델은 받쳐 주지만 강한 모델은 묶어 둡니다. 모델이 좋아질수록 절차가 발목을 잡습니다.
- **풀어 주면** 순정 에이전트가 됩니다. 자유로워도 되는 곳과 안 되는 곳을 가리지 않습니다. 사용자가 뭘 뜻했는지까지 제멋대로 정하고, 아무도 정하지 않은 부분은 그럴듯한 추측으로 메웁니다.

Dryforge의 답은 세 번째, 의도에 묶인 bounded autonomy입니다. 에이전트는 경계 안에서 완전히 자유롭지만, 그 경계를 스스로 옮길 수는 없습니다. 그 경계가 바로 사용자의 의도입니다.

**에이전트가 머리가 나빠서 실패하는 일은 드뭅니다.** 대부분은 추론 실수처럼 보이는 권한 문제입니다. 아무도 말하지 않은 제품 규칙을 짐작하고, 지금 있는 코드를 원래 의도라고 믿고, 요구 사항을 만들기 쉬운 쪽으로 슬쩍 바꿔 읽고, 자기가 쓴 요약을 끝났다는 증거로 삼습니다. 하나하나는 그럴듯하지만, 쌓이면 결과가 원하던 것에서 멀어집니다.

**그래서 Dryforge는 권한을 나눴습니다.** bounded autonomy 위에 자체 권한 모델을 얹었습니다.

- 일에 걸린 모든 결정에는 주인이 있습니다. 사용자의 결정은 어떤 모습으로 오든 사용자에게 돌아가고, 에이전트의 결정은 에이전트가 가진 걸 다 써서 내립니다.
- 알아낼 수 있는 건 묻지 않고, 사용자가 정할 건 절대 짐작하지 않습니다.
- 출처끼리 말이 다르면 아무거나 골라 넘어가지 않고 사용자에게 가져옵니다.
- 어떤 프로세스도 사용자의 결정을 대신하지 않고, 사용자의 결정은 사용자 없이 내려지지 않습니다. 짐작할 바에는 멈춥니다.

**나머지 설계는 전부 여기서 나옵니다.**

- **천장이 아니라 바닥.** 꼭 지켜야 할 것만 못 박고 추론은 열어 둡니다. 천장은 더 좋은 모델이 알아서 높입니다.
- **추론은 믿고, 자기 채점은 믿지 않는다.** 에이전트의 판단은 믿지만, 자기 일을 스스로 채점하게 두지는 않습니다. 끝났는지는 에이전트의 말이 아니라 증거가 정합니다.
- **노력은 위험만큼.** 작은 변경은 가볍게, 위험한 변경은 필요한 만큼 엄밀하게 다룹니다. 보여 주기용 꼼꼼함은 미덕이 아니라 실패입니다.
- **대리 지표가 아니라 목적.** 하네스가 더한 규칙, 체크리스트, 게이트는 쉽게 에이전트의 최적화 대상이 됩니다. Dryforge는 장치를 위한 장치를 더하지 않습니다. 가장 짧은 길이 곧 의도에 닿는 길이 되도록 일을 짭니다.

**사용자의 자리가 달라집니다.** 모든 단계를 지켜보거나 승인할 필요도, 코드를 보면 알 수 있는 걸 대신 답할 필요도 없습니다. Dryforge는 사용자의 결정이 필요한 곳에서만, 오직 그곳에서만 사용자를 부릅니다. 무엇이 만들어지든 저자는 여전히 사용자이고, 왜 그렇게 만들어졌는지도 압니다.

경계가 움직이지 않으니, 그 안에서는 모든 것이 전력으로 달릴 수 있습니다.

<a id="dryforge"></a>

# Dryforge란

Dryforge는 첫 질문부터 검증된 결과까지, 의도를 한 번도 놓치지 않습니다.

스펙 주도 개발, TDD, 병렬 에이전트 같은 관행의 묶음이 아닙니다. 모든 것이 한 가지 원칙에서 나옵니다. 이 결정은 누구의 것인가.

## Intent, understood

Dryforge는 여기서 시작하고, 여기서 다른 도구들과 갈라집니다.

가져온 것은 지시가 아니라 재료로 읽습니다. 자세한 문서라고 맞다고 믿지 않고, 대충 쓴 메모라고 짐작으로 때우지도 않습니다. 사용자가 한 말이 슬그머니 다른 뜻으로 바뀌는 일은 없습니다.

대부분의 도구는 설문지처럼 묻습니다. 정해진 항목을 절차 순서대로 하나씩 묻거나, 아예 안 묻고 짐작합니다. Dryforge는 모든 걸 먼저 읽고, 판단이 필요한 것만 묻습니다.

하려는 일을 잘 알수록 덜 묻습니다. 말로, 자료로, 코드로 이미 분명해진 건 알아서 정리하고 다시 묻지 않습니다.

중요한 건 대개 말로 나오지 않습니다. 그래서 말하지 않은 부분까지 따져 보고, 사용자가 정할 것만 묻습니다. 절차에 질문 단계가 있어서가 아니라, 그 결정이 사용자의 것이라서입니다.

- 요구 사항에 관한 질문은 바로 사용자에게 갑니다.
- 사용자가 정할 일인데 기술적인 문제라면, 엔지니어가 아니어도 고를 수 있도록 선택지와 추천을 같이 가져옵니다.
- 입력이 짧을수록 더 깊이 묻습니다. 한 줄 아이디어에 한 줄짜리 설계로 답하지 않습니다.

사용자가 정할 건 몰래 정해지지 않습니다. 나중에 바꾸고 싶을 수 있는 기본값은 승인 전에 따로 짚어 줍니다.

사용자는 자기 몫의 질문에만 답하고, 그 답은 하나하나가 중요합니다. 대화는 끝나도 의도는 문서로 남습니다.

## Intent, realized

승인한 건 뜻한 그대로 만듭니다. 더 쉬운 버전으로 슬쩍 바꾸지 않고, 돌아가기만 하는 코드에서 멈추지도 않습니다. 하다가 현실이 계획과 어긋나면 의도를 거기에 맞춰 구부리지 않고 사용자에게 돌아옵니다.

구조는 일에 필요한 만큼만 붙습니다. 테스트, 병렬 작업, 격리, 독립 리뷰가 다 있지만 일이 필요로 할 때만 쓰고, 보여 주기로 쓰지 않습니다. 바빠 보이려고 띄우는 에이전트는 없습니다.

끝났다는 건 검증됐다는 뜻이고, 검증은 실제로 돌려 본 것이어야 합니다. 돌리지 못한 검증은 통과가 아니라 실패입니다.

프로젝트 문서에는 정한 것과 실제로 만든 것이 함께 반영됩니다.

## Intent, kept

무엇을 왜 정했는지가 프로젝트에 남습니다. 루프는 매번 지난번에 정리한 것에서 다시 시작하니, 프로젝트가 커질수록 질문은 날카로워지고 줄어듭니다. 오래 쓸수록 프로젝트를 더 잘 압니다.

기록은 도구 속이 아니라 저장소에 평범한 문서로 남습니다. 에이전트를 바꿔도 프로젝트는 그대로 따라옵니다.

지금 쓰는 에이전트에 그대로 붙고, 특정 모델에 맞춰져 있지 않습니다. 스킬 소스 하나로 지원하는 모든 에이전트에서 돌아가고, 새 에이전트를 붙이는 데는 패키징만 있으면 됩니다.

<a id="getting-started"></a>

# 시작하기

## 명령어

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="assets/readme/loop-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="assets/readme/loop-light.svg">
  <img alt="새 프로젝트는 ready로 시작하고, 기존 코드베이스는 migration으로 한 번 옮겨 옵니다. 그다음은 ready와 go를 반복하며 프로젝트에 남는 기록을 이어 갑니다." src="assets/readme/loop-light.svg" width="100%">
</picture>

새 프로젝트는 `ready`로 시작하고, 기존 코드베이스는 `migration`으로 한 번 옮겨 옵니다. 그다음은 `ready`와 `go`가 전부입니다. 배울 워크플로도, 설정할 것도 없습니다. 사용자가 꼭 나서야 하는 순간은 두 번, 무엇이든 만들기 전에 의도를 승인할 때와 결과를 받아들일 때입니다.

어떤 언어로 말하든 그 언어로 일하고, 질문과 결과 사이에는 조용히 일합니다. 새 프로젝트, 기능 추가, 코드베이스 전반을 건드리는 변경처럼 잘못 짚으면 대가가 큰 일에 쓰세요. 작고 이미 분명한 수정이라면 필요 없습니다.

`/ready`, `/go`, `/migration`으로 호출합니다. Codex에서는 `$ready`, `$go`, `$migration`처럼 `$`를 붙입니다.

### ready

```text
/ready <anything>
```

가진 걸 그대로 가져오세요. 한 줄 아이디어, 브레인스토밍, 애매한 스펙, PDF, 다른 도구가 짠 계획을 하나씩 가져와도, 한꺼번에 가져와도 됩니다. 생각을 정리하거나 형식에 맞출 필요는 없습니다.

ready는 프로젝트를 읽고, 무엇을 원하는지 파악한 뒤, 필요한 것만 묻습니다. 남은 결정이 다 정리되면 승인할 결과를 내놓습니다. `.dryforge/` 아래 평범한 Markdown으로 적힌 의도이고, 로컬에만 있습니다. 승인하기 전에는 아무것도 만들지 않습니다. 승인했으면 같은 세션에서 `go`를 실행하세요. 그 전에 세션이 끝나도 새 세션의 `/go`가 `.dryforge/`에 있는 승인된 의도를 이어받습니다.

저장소가 아직 없다면 ready가 만들자고 먼저 제안합니다.

### go

```text
/go
```

go는 승인한 내용을 만들고 검증합니다. 결과가 나오거나 blocker가 생겼을 때만 말하고, 요청한 내용을 바꿔야 할 상황이 오면 멈추고 묻습니다. 끝나면 결과와 함께 프로젝트 문서에서 바뀐 부분을 알려 줍니다.

저장소는 사용자의 것입니다. 새 프로젝트는 main에서 바로 만들고, 기존 프로젝트는 별도 브랜치에서 작업한 뒤 merge할지, pull request를 열지, 그대로 둘지 묻습니다. 스스로 merge하는 일은 절대 없습니다.

### migration

```text
/migration
```

코드는 무엇이 만들어졌는지는 보여 주지만, 무엇을 뜻했는지는 보여 주지 않습니다. 권한 검사가 있다는 건 증명해도, 그게 정책의 전부라는 건 증명하지 못합니다.

migration은 코드베이스를 읽고 알아낼 수 있는 건 스스로 알아냅니다. 비즈니스 규칙, 보안 정책, 무엇이 의도된 것이고 무엇이 레거시인지처럼 코드가 말해 주지 않는 건 묻습니다. 기존 문서도 그대로 믿지 않고 따져 본 뒤, 무엇을 남기고 버렸는지 이유와 함께 알려 줍니다.

프로젝트 문서는 migration이 쓰고, 커밋은 사용자가 합니다. CLAUDE.md나 AGENTS.md가 이미 있으면 함께 검토하고 백업한 뒤, 승인을 받아 다시 씁니다. 한 번 실행하고, 커밋하고, 새 세션을 여세요. 그다음부터 프로젝트는 `ready` → `go` 루프로 돌아갑니다.

## 프로젝트에 남는 것

```text
your-project/
├── AGENTS.md / CLAUDE.md     # 에이전트가 가장 먼저 읽는 문서
├── docs/
│   ├── architecture.md       # 시스템 구조
│   ├── business-rules.md     # 제품이 지켜야 할 동작
│   ├── security.md           # 권한과 보호 대상
│   ├── standards.md          # 어기면 안 되는 규칙
│   ├── engineering-notes.md  # 함정, 코드만 봐서는 모르는 동작
│   ├── operations.md         # 설치, 빌드, 배포
│   ├── contracts.md          # 입출력 계약
│   └── tracking/             # 진행 상황과 그 뒤의 결정
└── <module>/AGENTS.md        # 모듈별 규칙
```

루프를 한 번 돌 때마다 프로젝트의 의도가 글로 남습니다. 결정과 이유, 코드에는 드러나지 않는 규칙 가운데 중요한 것만 남깁니다. 매번 손댄 부분을 코드와 맞춰 두기 때문에, 쌓일수록 불어나지 않고 오히려 또렷해집니다. 다음 `ready`는 여기서 시작합니다.

평범한 Markdown이고, 작업하는 언어로 쓰이며, 에이전트가 원래 읽는 진입점에 놓입니다. 문서가 설명하는 건 Dryforge가 아니라 프로젝트입니다. 어떤 에이전트, 어떤 세션이든 Dryforge 없이도 이 문서를 보고 일합니다. 플러그인을 지워도 문서는 남습니다.

Dryforge는 부를 때만 움직이지만, 남긴 문서는 계속 쓰입니다.

작업 기록은 `.dryforge/` 아래 로컬에만 둡니다. 그중 중요한 것만 `docs/`로 옮겨 다른 작업물과 함께 저장소에 넣습니다.

# 요구 사항

> [!IMPORTANT]
> Git이 필요합니다. `go`를 실행하기 전에 작업 트리가 깨끗해야 합니다. `.dryforge/` 밖의 변경과 새 파일이 모두 커밋돼 있어야 하고, main 브랜치가 원격을 추적한다면 모든 커밋이 push돼 있어야 합니다.

# 라이선스

[Apache License 2.0](LICENSE) (`Apache-2.0`).

<br />

<div align="center">

<img src="https://dryforge.dev/logo-mark.svg" width="40" height="40" alt="Dryforge">

<sub><a href="#top">back to top</a> · <a href="https://dryforge.dev">dryforge.dev</a> · © 2026 prekuter · Apache-2.0</sub>

</div>
