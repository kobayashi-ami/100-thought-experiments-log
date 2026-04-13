#!/bin/bash
# Claude Code PostToolUse フック用 自動push スクリプト

REPO_DIR="/Users/amikobayashi/reading/100-thought-experiments"

# 書き込み先がこのリポジトリ内かチェック
FILE_PATH=$(echo "$CLAUDE_TOOL_INPUT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('file_path',''))" 2>/dev/null)

if [[ "$FILE_PATH" != *"/reading/100-thought-experiments/"* ]]; then
  exit 0
fi

cd "$REPO_DIR" || exit 0

# 変更がなければ何もしない
if git diff --quiet && git diff --cached --quiet; then
  exit 0
fi

git add -A
git commit -m "ログ更新: $(date '+%Y-%m-%d %H:%M')"
git push origin main
