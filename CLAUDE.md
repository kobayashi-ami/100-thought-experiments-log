# 100の思考実験 読書ログ — Claude向け作業メモ

## このプロジェクトの概要
Julian Baggini「100の思考実験」の読書ログシステム。
ユーザーが「N番読んだ、こう思った」と話しかけてきたら、ログを書き込む。

## セットアップ済みの状態（再確認不要）
- GitHub: https://github.com/kobayashi-ami/100-thought-experiments-log
- gh CLI: インストール済み、kobayashi-ami アカウントで認証済み
- git: user.name="kobayashi-ami", email="kobayashi-ami@users.noreply.github.com"
- 自動push: ~/.claude/settings.json に PostToolUse フック設定済み
  - Write/Edit 後に autopush.sh が走り、このディレクトリの変更を自動 git push

## ファイル構成
- `progress.md` — 全100実験の進捗テーブル（読んだ実験は `[ ]` → `[x]` に更新）
- `logs/NNN_タイトル.md` — 各実験のログ（NNNは3桁ゼロ埋め）
- `TEMPLATE.md` — ログのフロントマター形式
- `log.sh <番号> [タイトル]` — ログファイル作成スクリプト
- `stats.sh` — プログレスバー付き進捗表示
- `autopush.sh` — Claude Code フック用自動pushスクリプト

## ログを書くときのルール
1. `logs/NNN_タイトル.md` を Write ツールで作成（NNNは3桁）
2. `progress.md` の該当行を `[ ]` → `[x]` に Edit ツールで更新
3. フックが自動でgit add/commit/pushする（手動操作不要）

## ログのフォーマット（TEMPLATE.mdより）
```
---
number: NNN
title: タイトル
date: YYYY-MM-DD
status: 読了
tags: []
---

## 思考実験の概要

## 問いの核心

## 自分の考え

## 疑問・反論

## 評価
★★★☆☆
```
