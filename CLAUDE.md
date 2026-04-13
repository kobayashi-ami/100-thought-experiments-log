# Claude向け引き継ぎメモ
## 100の思考実験 読書ログシステム

### このディレクトリの目的
ユーザーがJulian Baggini「100の思考実験」を読んで考えたことを記録するシステム。
Claudeがログファイルを書き、GitHubに自動pushする。

### セットアップ状態（変更不要）
- GitHub: https://github.com/kobayashi-ami/100-thought-experiments-log
- gh CLI: kobayashi-ami アカウントで認証済み
- 自動push: ~/.claude/settings.json の PostToolUse フック → autopush.sh

### ユーザーが「思考実験X番読んだ」と言ったときの作業手順
1. logs/NNN.md を確認（既存なら追記、なければ新規作成）
2. TEMPLATE.md の形式で書く
3. progress.md の該当行を [ ] → [x] に更新し、読了日を記入
4. 保存 → autopush.sh が自動 git push する

### ログファイルの命名規則
logs/NNN.md（例: logs/001.md, logs/042.md）

### 注意
- autopush.sh が動かない場合は手動: cd ~/reading/100-thought-experiments && git add -A && git commit -m "更新" && git push
- progress.md 最終行の進捗カウントも更新する
