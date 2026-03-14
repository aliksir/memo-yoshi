#!/bin/bash
# ===========================================
# MEMO-YOSHI インストーラー
# ===========================================
#
# Claude Code スキルとメモテンプレートをインストールする
#
# 使い方:
#   bash memo-yoshi/install.sh
#   bash memo-yoshi/install.sh --global   # ~/.claude/ にメモファイルを配置
#

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="${HOME}/.claude"
COMMANDS_DIR="${CLAUDE_DIR}/commands"

# 色定義
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[0;33m'
NC='\033[0m'

echo ""
echo -e "${CYAN}=========================================${NC}"
echo -e "${CYAN}  MEMO-YOSHI Installer${NC}"
echo -e "${CYAN}=========================================${NC}"
echo ""

# コマンドディレクトリ作成
mkdir -p "$COMMANDS_DIR"

# スキルファイルをコピー
if [ -f "$COMMANDS_DIR/memo.md" ]; then
    echo -e "  ${YELLOW}EXISTS${NC} commands/memo.md (skipped)"
else
    cp "$SCRIPT_DIR/memo.md" "$COMMANDS_DIR/memo.md"
    echo -e "  ${GREEN}COPY${NC} commands/memo.md"
fi

# メモファイル配置
MEMO_PATH="$CLAUDE_DIR/MEMO-YOSHI.md"

if [ -f "$MEMO_PATH" ]; then
    echo -e "  ${YELLOW}EXISTS${NC} MEMO-YOSHI.md (skipped)"
else
    cp "$SCRIPT_DIR/MEMO-YOSHI.md" "$MEMO_PATH"
    echo -e "  ${GREEN}COPY${NC} MEMO-YOSHI.md -> ~/.claude/"
fi

echo ""
echo -e "${CYAN}=========================================${NC}"
echo -e "  ${GREEN}Installation complete!${NC}"
echo -e "${CYAN}=========================================${NC}"
echo ""
echo "Usage:"
echo "  /memo           Open MEMO-YOSHI.md in your editor"
echo "  /memo read      Read memos into Claude session"
echo "  /memo tidy      Organize memos by category"
echo "  /memo add ...   Add a memo"
echo "  /memo act       Execute actions from memo content"
echo ""
echo "  Or just type anything after /memo to add it as a note:"
echo "  /memo check the Node.js version later"
echo ""
echo -e "Memo file: ${CYAN}${MEMO_PATH}${NC}"
echo ""

# takeover連携のオプション案内
echo -e "${CYAN}Optional: Auto-read on session start${NC}"
echo "  Add this to your /takeover workflow or CLAUDE.md:"
echo ""
echo '  ## Session Start'
echo '  - Read `~/.claude/MEMO-YOSHI.md` if it exists'
echo ""
