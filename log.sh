#!/usr/bin/env zsh
# 100の思考実験 — ログ作成スクリプト
# 使い方: ./log.sh <番号> [タイトル]
# 例:     ./log.sh 1 "食われたがっている豚"

set -e

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
LOGS_DIR="$BASE_DIR/logs"
PROGRESS="$BASE_DIR/progress.md"
TODAY=$(date +%Y-%m-%d)

# 引数チェック
if [[ -z "$1" ]]; then
  echo "使い方: ./log.sh <番号> [タイトル]"
  echo "例:     ./log.sh 1"
  echo "        ./log.sh 42 '二重効果の原理'"
  exit 1
fi

NUM=$(printf "%03d" "$1")
TITLE="${2:-思考実験 $NUM}"
FILENAME="$LOGS_DIR/${NUM}.md"

# すでにファイルがある場合は開くだけ
if [[ -f "$FILENAME" ]]; then
  echo "既存ログを開きます: $FILENAME"
  ${EDITOR:-nano} "$FILENAME"
  exit 0
fi

# テンプレートから新規作成
cat > "$FILENAME" <<EOF
---
number: $NUM
title: $TITLE
date: $TODAY
status: 読了
tags: []
---

## 思考実験の概要

<!-- バジーニが提示したシナリオを一言で -->

## 問いの核心

<!-- この実験が問いかけているのは何か -->

## 自分の考え

<!-- 最初の直感、論理的整理、迷い、など -->

## 気になった点・疑問

<!-- 引っかかった部分、もっと考えたいこと -->

## 評価

**刺さり度**: ★★★☆☆
**難易度**: ★★★☆☆
**また考えたい**: yes / no
EOF

echo "ログ作成: $FILENAME"

# progress.md の状態を更新 ([ ] → [x])
sed -i '' "s/| $NUM | .* | \[ \] |/| $NUM | $TITLE | [x] |/" "$PROGRESS" 2>/dev/null || true

# エディタを開く
${EDITOR:-nano} "$FILENAME"

echo ""
echo "完了！ログ保存先: $FILENAME"
