#!/usr/bin/env zsh
# 読書統計を表示するスクリプト

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
LOGS_DIR="$BASE_DIR/logs"

TOTAL=100
DONE=$(find "$LOGS_DIR" -name "*.md" ! -name ".gitkeep" 2>/dev/null | wc -l | tr -d ' ')
REMAINING=$((TOTAL - DONE))
PCT=$(( DONE * 100 / TOTAL ))

# プログレスバー
FILLED=$(( DONE * 40 / TOTAL ))
EMPTY=$(( 40 - FILLED ))
BAR=""
for ((i=0; i<FILLED; i++)); do BAR="${BAR}█"; done
for ((i=0; i<EMPTY; i++)); do BAR="${BAR}░"; done

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  100の思考実験 — 読書進捗"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  [${BAR}] ${PCT}%"
echo "  読了: ${DONE} / ${TOTAL}  (残り ${REMAINING})"
echo ""

if [[ $DONE -gt 0 ]]; then
  echo "  最近のログ:"
  ls -t "$LOGS_DIR"/*.md 2>/dev/null | grep -v '.gitkeep' | head -5 | while read f; do
    name=$(basename "$f" .md)
    title=$(grep "^title:" "$f" 2>/dev/null | sed 's/title: //' | tr -d '"')
    date=$(grep "^date:" "$f" 2>/dev/null | sed 's/date: //')
    echo "    [$name] $title ($date)"
  done
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
