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
  <a href="#install-and-update">インストール</a> ·
  <a href="#getting-started">はじめに</a> ·
  <a href="https://dryforge.dev">ウェブサイト</a> ·
  <a href="./README.md">English</a> ·
  <a href="./README_ko.md">한국어</a> ·
  <a href="./README_zh.md">中文</a>
</p>

</div>

<a id="install-and-update"></a>

# インストールと更新

<details>
<summary><b>Claude Code</b></summary>


インストール：

```text
/plugin marketplace add prekuter/dryforge
/plugin install dryforge@dryforge
```


更新：

```text
/plugin marketplace update dryforge
/plugin update dryforge@dryforge
```


**自動更新：** デフォルトはオフです。`/plugin` → Marketplaces → dryforge → Enable auto-update でオンにできます。


</details>

<details>
<summary><b>Codex</b></summary>


インストール：

```text
codex plugin marketplace add prekuter/dryforge
codex plugin add dryforge@dryforge
```


更新：

```text
codex plugin marketplace upgrade dryforge
```


**自動更新：** オンです。新しいリリースはセッション開始時に読み込まれます。


</details>

<details>
<summary><b>Grok Build</b></summary>


インストール：

```text
grok plugin marketplace add prekuter/dryforge
grok plugin install dryforge
```


更新：

```text
grok plugin update dryforge
```


**自動更新：** オンです。新しいリリースはセッション開始時に読み込まれます。


</details>

<details>
<summary><b>GitHub Copilot CLI</b></summary>


インストール：

```text
copilot plugin marketplace add prekuter/dryforge
copilot plugin install dryforge@dryforge
```


更新：

```text
copilot plugin update dryforge
```


**自動更新：** デフォルトはオフです。`~/.copilot/settings.json` の `extraKnownMarketplaces` にある dryforge の項目に `"autoUpdate": true` を追加するとオンになります。


</details>

<details>
<summary><b>Antigravity CLI</b></summary>


インストール：

```text
agy plugin install https://github.com/prekuter/dryforge/tree/main/antigravity
```


更新：

```text
agy plugin install https://github.com/prekuter/dryforge/tree/main/antigravity
```


**自動更新：** 対応していません。同じインストールコマンドをもう一度実行すると更新されます。


</details>

<a id="the-problem"></a>

# エージェント、使い方を間違えていました。

エージェントは、もう仕事のやり方を知っています。足りないのは、あなたの意図です。

業界はその穴をプロセスで埋めてきました。ワークフロー、方法論、ルール、並列エージェント。何を作るのか誰も聞かないうちに、すべて決まっています。方法が先に立ち、意図はそこに合わせて削られます。

**意図が方法を決めるべきなのに、今は方法が意図を決めています。**

> *「まずテストを書きます。で、何を作るんでしたっけ？」*

順序が逆です。意図がはっきりすれば、方法は自然についてきます。方法から決めるのは厳密さではありません。誰も先に話を聞かなかった、というだけです。

しかもそのルールは、仕事を見る前に、その時点のモデルに合わせて書かれたものです。次のモデルが出れば合わなくなり、構成ごと作り直し。その次のモデルでも、また作り直しです。

- **ワークフロー**はエージェントの手順を一つひとつ決め打ちするので、新しいモデルが出るたびに崩れ、そのツケはモデルに回されます。
- **TDD の一律適用**は、設定ファイル 1 行にも決済ロジックにも同じ手続きを求めます。
- **不要なサブエージェント**は、口に出されていない意図をそれぞれ推測し、燃やしたトークンを進捗と呼びます。
- **ループ**は、誰も決めていないゴールに向かって何時間も回り続けます。
- **質問**は手順の一ステップにすぎません。コードを見ればわかることは聞くのに、あなたが決めるべきことは黙って決められてしまいます。いちばん危ないのは、最後まで出てこなかった質問です。
- **人の確認**は、あなたにしか下せない判断ではなく、プロセスのあらゆるステップに挟まります。
- **仕様書**は手続きのために作られ、コードとずれていき、やがて誰にも読まれなくなります。

誰も解いていない問題は、いちばん最初にありました。あなたが本当に何を求めているのかを理解することです。

<a id="approach"></a>

# 根本から違うアプローチ

エージェントは、本当に任せられるほど賢くなりました。問題はもう任せるかどうかではなく、どこまで任せるかです。

これまでの答えは二つ。どちらも間違っています。

- **締めつけすぎる**とプロセスになります。すべての手順を決め打ちし、あらゆるケースを先に並べておく。弱いモデルは支えられても、強いモデルは縛られます。モデルが良くなるほど、手順が足を引っ張ります。
- **手放す**と素のエージェントになります。自由であるべきところでも、そうでないところでも、同じように自由です。あなたが何を意図したかまで勝手に決め、誰も決めていない部分はもっともらしい推測で埋めます。

Dryforge の答えは三つ目、あなたの意図に根ざした bounded autonomy です。エージェントは境界の中では完全に自由ですが、その境界を自分で動かすことはできません。その境界こそ、あなたの意図です。

**エージェントが頭の悪さで失敗することは、めったにありません。** 多くは推論ミスに見えて、実は権限の問題です。誰も言っていないプロダクトのルールを推測する。今あるコードを本来の意図の証拠とみなす。要件を作りやすい方向に読み替える。自分で書いた要約を完了の証拠にする。一つひとつはもっともらしくても、積み重なると結果は望んでいたものから離れていきます。

**だから Dryforge は権限を分けました。** bounded autonomy の上に、独自の権限モデルを載せています。

- 仕事の中のすべての判断には持ち主がいます。あなたの判断は、どんな形で現れてもあなたに戻ります。エージェントの判断は、エージェントが持てるすべてを使って下します。
- 調べればわかることは聞かず、あなたが決めることは決して推測しません。
- 情報源どうしが食い違えば、黙ってどちらかを選ばず、その衝突をあなたに持ってきます。
- どのプロセスもあなたの判断を代わりに下さず、あなたの判断があなた抜きで下されることもありません。推測するくらいなら止まります。

**残りの設計はすべてここから出てきます。**

- **天井ではなく床。** 守るべきことだけを固定し、推論は開いておきます。天井は、より良いモデルが自分で上げます。
- **推論は信じ、自己採点は信じない。** エージェントの判断は信頼しますが、自分の仕事を自分で採点させはしません。終わったかどうかは、エージェントの言葉ではなく証拠で決まります。
- **労力はリスクに比例。** 小さな変更は小さく、危ない変更には必要なだけ厳密に。見せるための丁寧さは美徳ではなく失敗です。
- **代理指標ではなく目的を守る。** ハーネスが足すルール、チェックリスト、ゲートは、すぐにエージェントの最適化対象になります。Dryforge は仕組みのための仕組みを足しません。最短の道がそのまま意図に届く道になるよう、仕事を組み立てます。

**あなたの立ち位置が変わります。** すべてのステップを監督したり、すべての段階を承認したり、コードが教えられたはずのことを代わりに答えたりする必要はありません。呼ばれるのは、あなたが決めるべきところだけです。作られるものの作者は変わらずあなたで、なぜそうなっているのかもわかっています。

境界が動かないから、その内側ではすべてが全力で動けます。

<a id="dryforge"></a>

# Dryforge とは

Dryforge は、最初の質問から検証済みの成果まで、あなたの意図を一度も手放しません。

仕様駆動開発、TDD、並列エージェントといった慣習の寄せ集めではありません。すべては一つの原則から出てきます。その判断は誰のものか。

## Intent, understood

Dryforge はここから始まり、ここで他のツールと分かれます。

持ち込まれたものは、指示ではなく材料として読みます。詳しい文書だから正しいとは決めつけず、ラフなメモだから推測でいいとも考えません。あなたの言葉が、意図しない何かにこっそり書き換えられることはありません。

多くのツールは、アンケートのように質問します。決まった項目を手順どおり一つずつ聞くか、まったく聞かずに推測するか。Dryforge はすべてを先に読み、判断が必要なことだけを聞きます。

やろうとしていることを理解するほど、質問は減ります。言葉、持ち込んだ資料、コードですでに明らかなことは、自分で整理して聞き直しません。

大事なことほど、たいてい口にされません。だから言及されていない部分まで考え、あなたが決めるべきことだけを聞きます。手順に質問のステップがあるからではなく、その判断があなたのものだからです。

- 要件についての質問は、まっすぐあなたに届きます。
- あなたが決めることでも技術的な内容なら、選択肢とおすすめを添えて持ってきます。エンジニアでなくても選べます。
- 入力が少ないほど、深く聞きます。一行のアイデアに一行の設計は返しません。

あなたが決めることが、知らないうちに決まることはありません。あとで変えたくなりそうなデフォルト値は、承認の前に印をつけて知らせます。

答えるのは自分の分の質問だけで、その一つひとつが大切です。会話は終わっても、意図は終わりません。会話がなくても読めるよう、ドキュメントとして残ります。

## Intent, realized

承認したものは、意図どおりに作られます。簡単な版にすり替えず、動くだけのコードで止めもしません。途中で計画と食い違う事態が起きても、意図をねじ曲げて合わせず、あなたのところに戻ってきます。

構造は仕事に必要な分だけ付けます。テスト、並列作業、隔離、独立レビューはすべて揃っていますが、仕事が求めるときだけ使い、形だけでは使いません。忙しそうに見せるためのエージェントは立ち上げません。

完了とは検証済みということで、その検証は実際に実行されたものでなければなりません。実行できなかった検証は、合格ではなく失敗です。

プロジェクトに書き戻される内容には、決めたことと実際に作られたものの両方が反映されます。

## Intent, kept

何をなぜ決めたのかが、プロジェクトに残ります。ループは毎回、前回整理したすべてから始まるので、プロジェクトが育つほど質問は鋭く、少なくなります。使うほど、プロジェクトのことをよく知るようになります。

記録はツールの中ではなく、リポジトリにふつうのドキュメントとして残ります。エージェントを替えても、プロジェクトはそのままついてきます。

今使っているエージェントにそのまま入り、特定のモデルに合わせてはいません。一つのスキルソースが対応するすべてのエージェントで動き、エージェントを増やすのに必要なのはパッケージングだけです。

<a id="getting-started"></a>

# はじめに

## コマンド

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="assets/readme/loop-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="assets/readme/loop-light.svg">
  <img alt="新しいプロジェクトは ready から、既存のコードベースは migration で一度だけ移行します。その後は ready と go を繰り返し、プロジェクトに残る記録を引き継ぎます。" src="assets/readme/loop-light.svg" width="100%">
</picture>

新しいプロジェクトは `ready` で始め、既存のコードベースは `migration` で一度だけ移行します。あとは `ready` と `go` がループのすべてです。覚えるワークフローも、設定することもありません。あなたの出番は常に二回。何かを作る前に意図を承認するときと、結果を受け取るときです。

どの言語で書いても、その言語で仕事をします。質問と結果のあいだは静かです。新規プロジェクト、新機能、コードベース全体にまたがる変更など、思い込みの代償が大きい場面で使ってください。小さくて明確な修正には必要ありません。

`/ready`、`/go`、`/migration` で呼び出します。Codex ではプレフィックスが `$` なので、`$ready`、`$go`、`$migration` です。

### ready

```text
/ready <anything>
```

手元にあるものを、そのまま持ってきてください。一行のアイデア、ブレインストーミング、あいまいな仕様、PDF、他のツールが書いた計画、あるいは全部まとめて。考えを整理したり、形式に合わせたりする必要はありません。

ready はプロジェクトを読み、何を意図しているかをつかんだうえで、必要なことだけを聞きます。未決の判断がすべて片づくと、承認用の結果を渡します。`.dryforge/` の下にふつうの Markdown で書かれた意図で、ローカルにだけ置かれます。承認するまで何も作りません。承認したら、同じセッションで `go` を実行してください。その前にセッションが終わっても、新しいセッションの `/go` が `.dryforge/` から承認済みの意図を引き継ぎます。

リポジトリがまだなければ、ready が作成を提案します。

### go

```text
/go
```

go は承認した内容を実装し、検証します。口を開くのは、結果が出たときと本当のブロッカーにぶつかったときだけです。依頼内容が変わりそうなら、止まって聞きます。終わったら、結果とプロジェクトのドキュメントで変わった部分を報告します。

リポジトリはあなたのものです。新しいプロジェクトは main に直接作ります。既存のプロジェクトは別ブランチで作業し、終わったら merge するか、pull request を出すか、そのまま残すかを聞きます。勝手に merge することは決してありません。

### migration

```text
/migration
```

コードが示すのは何が作られたかであって、何が意図されたかではありません。権限チェックがあることは証明できても、それがポリシーのすべてだとは証明できません。

migration はコードベースを読み、自分でわかることを先に割り出します。そのうえで、ビジネスルール、セキュリティポリシー、どこが意図されたものでどこがただのレガシーかといった、コードからはわからないことを聞きます。既存のドキュメントは鵜呑みにせず吟味し、何を残して何を捨てたかを理由とともに伝えます。

プロジェクトのドキュメントは migration が書き、commit はあなたに任せます。CLAUDE.md や AGENTS.md がすでにあれば、一緒に確認してバックアップしたうえで、承認を得て書き直します。一度実行し、commit して、新しいセッションを開いてください。以降、プロジェクトは `ready` → `go` のループで回ります。

## プロジェクトに残るもの

```text
your-project/
├── AGENTS.md / CLAUDE.md     # どのエージェントも最初に読むファイル
├── docs/
│   ├── architecture.md       # システムの構成
│   ├── business-rules.md     # プロダクトが守るべき振る舞い
│   ├── security.md           # 権限と保護対象
│   ├── standards.md          # 破ってはいけないルール
│   ├── engineering-notes.md  # 落とし穴、コードだけでは見えない仕組み
│   ├── operations.md         # セットアップ、ビルド、デプロイ
│   ├── contracts.md          # 入出力の約束
│   └── tracking/             # 進捗と、その裏の判断
└── <module>/AGENTS.md        # モジュールごとのルール
```

ループを一周するたびに、プロジェクトの意図が記録として残ります。判断とその理由、コードには表れないルールのうち、大事なものだけが残ります。実行のたびに触った部分をコードと揃えるので、記録は積み重なっても膨らまず、むしろ鮮明になります。次の `ready` はここから始まります。

ふつうの Markdown で、作業している言語で書かれ、エージェントがもともと読むエントリーポイントに置かれます。ドキュメントが説明するのは Dryforge ではなく、あなたのプロジェクトです。どのエージェントでも、どのセッションでも、Dryforge があってもなくても、このドキュメントをもとに仕事をします。プラグインを消しても、ドキュメントは残ります。

Dryforge は呼んだときだけ動きますが、残したものは働き続けます。

タスクごとの作業記録は `.dryforge/` の下、ローカルにだけ残ります。大事なものは `docs/` に移され、ほかの成果物と一緒にリポジトリに入ります。

# 要件

> [!IMPORTANT]
> Git が必要です。`go` を実行する前に、作業ツリーがクリーンでなければなりません。`.dryforge/` の外に未コミットや未追跡のファイルがなく、main ブランチがリモートを追跡している場合は、未プッシュのコミットもない状態にしてください。

# ライセンス

[Apache License 2.0](LICENSE)（`Apache-2.0`）。

<br />

<div align="center">

<img src="https://dryforge.dev/logo-mark.svg" width="40" height="40" alt="Dryforge">

<sub><a href="#top">back to top</a> · <a href="https://dryforge.dev">dryforge.dev</a> · © 2026 prekuter · Apache-2.0</sub>

</div>
