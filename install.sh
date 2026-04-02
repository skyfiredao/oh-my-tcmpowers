#!/bin/bash
# Oh My TCM Powers 安装脚本
# 将 omtp-* 技能和 agent 通过软链接安装到对应目录
#
# 支持:
#   - OpenCode 原生: skills → ~/.config/opencode/skills/
#                    agents → ~/.config/opencode/agents/
#   - oh-my-openagent: 如果检测到已安装，额外软链接 agents → ~/.claude/agents/
#
# 用法:
#   ./install.sh          安装全部技能和 agent (Linux/macOS)

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_DIR="$SCRIPT_DIR/skills"
AGENTS_DIR="$SCRIPT_DIR/agents"

# --- 平台检测 ---
case "$(uname -s)" in
    Linux|Darwin) ;;
    *)
        echo "当前平台 ($(uname -s)) 不支持自动安装。"
        echo "请参阅 README 中的手动安装说明。"
        exit 1
        ;;
esac

# --- 通用软链接函数 ---
# 用法: install_links <源目录glob> <目标目录> <类型名>
install_links() {
    local src_pattern="$1"
    local target_dir="$2"
    local type_name="$3"
    local installed=0
    local skipped=0

    mkdir -p "$target_dir"

    for item in $src_pattern; do
        [ -e "$item" ] || continue
        local name
        name="$(basename "$item")"
        local target="$target_dir/$name"

        if [ -L "$target" ]; then
            local current
            current="$(readlink "$target")"
            if [ "$current" = "$item" ]; then
                echo "  跳过  $name (已安装)"
                skipped=$((skipped + 1))
                continue
            else
                echo "  更新  $name (旧链接 → $current)"
                rm "$target"
            fi
        elif [ -e "$target" ]; then
            echo "  警告  $name: 目标已存在且不是软链接，跳过"
            skipped=$((skipped + 1))
            continue
        fi

        ln -sf "$item" "$target"
        echo "  安装  $name → $target"
        installed=$((installed + 1))
    done

    echo "  [$type_name] 安装 $installed 个, 跳过 $skipped 个"
}

# --- 1. 安装 Skills (OpenCode 原生) ---
echo "=== 安装 Skills ==="
OC_SKILLS_DIR="$HOME/.config/opencode/skills"
install_links "$SKILLS_DIR/omtp-*" "$OC_SKILLS_DIR" "skills"

# --- 2. 安装 Agents (OpenCode 原生) ---
echo ""
echo "=== 安装 Agents (OpenCode) ==="
OC_AGENTS_DIR="$HOME/.config/opencode/agents"
install_links "$AGENTS_DIR/omtp-*.md" "$OC_AGENTS_DIR" "agents/opencode"

# --- 3. 安装 Agents (oh-my-openagent，如果检测到) ---
OC_CONFIG="$HOME/.config/opencode/opencode.json"
OMA_DETECTED=false

if [ -f "$OC_CONFIG" ]; then
    # 检测 plugin 数组中是否有 oh-my-opencode
    if grep -q '"oh-my-opencode' "$OC_CONFIG" 2>/dev/null; then
        OMA_DETECTED=true
    fi
fi

if [ "$OMA_DETECTED" = true ]; then
    echo ""
    echo "=== 安装 Agents (oh-my-openagent) ==="
    CLAUDE_AGENTS_DIR="$HOME/.claude/agents"
    install_links "$AGENTS_DIR/omtp-*.md" "$CLAUDE_AGENTS_DIR" "agents/oh-my-openagent"
else
    echo ""
    echo "未检测到 oh-my-openagent 插件，跳过 ~/.claude/agents/ 安装。"
fi

# --- 4. JSON 配置提示 ---
echo ""
echo "=== Agent 模型配置 ==="
echo "Agent 默认使用 OpenCode 全局模型。如需为 agent 指定不同模型:"
echo "  将 config/template-opencode-agents.json 的 \"agent\" 内容合并到"
echo "  ~/.config/opencode/opencode.json 中。"
echo ""
echo "完成。"
