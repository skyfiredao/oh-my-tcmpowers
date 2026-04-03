# 中医之心 Web 前端

**[English](README.md)**

单文件 Web 问诊界面，连接 [OpenCode](https://opencode.ai) HTTP API，通过问诊单采集症状后调度中医分析智能体，通过 SSE 实时流式回传分析结果。

## 功能

- **问诊单**：19 类症状采集（睡眠、寒热、汗出、饮食等），含基本信息（性别、年龄段、出生日期、职业等），数据从 `wenzhendan.json` 运行时加载
- **症状唯一入口**：所有分析均通过问诊单的"快速提交"或"提交问诊单"发起，无自由聊天输入
- **SSE 实时流式**：通过 Server-Sent Events 接收 AI 分析过程和结果，逐字渲染
- **会话管理**：新建、切换、删除会话，会话按工作目录（directory）隔离
- **智能体选择**：列出可用智能体（omtp-agent 排前），选中后下一条消息使用该智能体
- **技能列表**：展示已安装技能（omtp- 排前），前端校验技能存在
- **Markdown 渲染**：AI 回复支持完整 Markdown 格式（标题、列表、表格、代码块等）
- **消息折叠**：连续 2+ 条 assistant 过程消息自动折叠，只显示最后一条，可展开查看
- **调试面板**：工具调用、智能体事件等调试信息在独立面板中显示
- **深色/浅色主题**：一键切换，偏好保存到 localStorage
- **安全防护**：DOMPurify 净化 HTML 输出、SRI 校验 CDN 资源、CSP 内容安全策略、密码存储在 sessionStorage、协议校验、SSE 重连次数限制

## 快速开始

### 1. 启动 OpenCode 服务器（必需）

```bash
opencode serve
```

默认地址 `http://localhost:4096`。

启用密码认证（网络访问时推荐）：

```bash
OPENCODE_SERVER_PASSWORD=yourpassword opencode serve
```

### 2. 托管前端文件

```bash
cd oh-my-tcmpowers/frontend
python3 -m http.server 9090
```

浏览器打开 `http://localhost:9090`。

### 3. 配置连接

首次打开时，在设置面板中填写：

- **服务地址**：OpenCode 服务器地址（默认 `http://localhost:4096`）
- **工作目录**：oh-my-tcmpowers 项目路径（用于定位智能体和技能）
- **密码**（可选）：如果 OpenCode 服务器启用了密码认证

## 网络访问

默认 `opencode serve` 绑定 `127.0.0.1`，CORS 仅允许 `localhost` 来源。从其他机器访问需要：

1. 设置 `OPENCODE_SERVER_PASSWORD` 保护 API
2. `--hostname 0.0.0.0` 绑定所有网络接口
3. `--cors` 将前端来源加入白名单
4. 前端设置面板中更新服务器地址

```bash
OPENCODE_SERVER_PASSWORD=yourpassword opencode serve \
  --hostname 0.0.0.0 \
  --cors http://192.168.1.100:9090
```

或配置文件（`opencode.json` / `~/.config/opencode/config.json`）：

```jsonc
{
  "server": {
    "hostname": "0.0.0.0",
    "cors": ["http://192.168.1.100:9090"]
  }
}
```

> **CORS 说明**：来源必须是含协议和端口的完整字符串（如 `http://192.168.1.100:9090`），不支持通配符。`--cors` 可重复指定多个来源，命令行和配置文件的值会合并。

## 文件

```
frontend/
├── index.html          # 单文件前端（HTML + CSS + JS）
├── wenzhendan.json     # 问诊单数据（19 个症状分类）
├── README.md           # 英文文档
└── README_zh.md        # 中文文档（本文件）
```

## 注意事项

- 必须通过 HTTP 访问（不支持 `file://`），因为需要连接 OpenCode API
- 问诊单数据从 `wenzhendan.json` 运行时加载，无内联 fallback
- 内部 compaction 消息从主对话视图中过滤
- 绿色调 UI 风格，桔红色品牌色

## 许可证

GPL-3.0
