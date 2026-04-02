#!/bin/bash
# Oh My TCM Powers 卸载脚本
# 移除 install.sh 创建的所有软链接
#
# 用法:
#   ./uninstall.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_DIR="$SCRIPT_DIR/skills"
AGENTS_DIR="$SCRIPT_DIR/agents"

remove_links() {
    local src_pattern="$1"
    local target_dir="$2"
    local type_name="$3"
    local removed=0
    local skipped=0

    for item in $src_pattern; do
        [ -e "$item" ] || continue
        local name
        name="$(basename "$item")"
        local target="$target_dir/$name"

        if [ -L "$target" ]; then
            rm "$target"
            echo "  移除  $name"
            removed=$((removed + 1))
        elif [ -e "$target" ]; then
            echo "  跳过  $name (不是软链接)"
            skipped=$((skipped + 1))
        else
            echo "  跳过  $name (未安装)"
            skipped=$((skipped + 1))
        fi
    done

    echo "  [$type_name] 移除 $removed 个, 跳过 $skipped 个"
}

echo "=== 卸载 Skills ==="
remove_links "$SKILLS_DIR/omtp-*" "$HOME/.config/opencode/skills" "skills"

echo ""
echo "=== 卸载 Agents (OpenCode) ==="
remove_links "$AGENTS_DIR/omtp-*.md" "$HOME/.config/opencode/agents" "agents/opencode"

echo ""
echo "=== 卸载 Agents (oh-my-openagent) ==="
remove_links "$AGENTS_DIR/omtp-*.md" "$HOME/.claude/agents" "agents/oh-my-openagent"

echo ""
echo "完成。"
echo "注意: config/template-opencode-agents.json 中的模型配置如已合并到 opencode.json，需手动移除。"
