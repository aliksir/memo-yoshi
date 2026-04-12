# memo-yoshi

Claude Codeとの非同期メモ共有ツール。人間がMarkdownファイルに雑にメモを書き、Claude Codeがスキル経由で読み書き・整理・アクション実行する。

## 技術スタック
- Claude Code スキル（`.claude/commands/memo.md`）
- Markdownファイル（`~/.claude/MEMO-YOSHI.md`）
- シェルスクリプト（`install.sh`）

## セットアップ
```bash
git clone https://github.com/aliksir/memo-yoshi.git
bash memo-yoshi/install.sh
```

インストール先:
- `~/.claude/MEMO-YOSHI.md` — メモファイル本体
- `~/.claude/commands/memo.md` — Claude Code スキル

## ビルド
該当なし（ビルド不要。スキル定義ファイル＋Markdownのみ）

## テスト
該当なし（自動テストなし）

## 開発規約
- `MEMO-YOSHI.md` は人間が直接編集可能な状態を維持する（バイナリ化しない）
- メモの内容をClaude Codeが勝手に削除しない（tidyは整理のみ、削除は人間の指示で）
- `/memo act` は破壊的操作を自動実行しない（実装・修正系は確認を取る）
- `終わりヨシッ！` マーク付きアイテムはtidyでアーカイブへ移動（削除しない）
- ファイル検索優先順位: カレントディレクトリの `MEMO-YOSHI.md` > `~/.claude/MEMO-YOSHI.md`
