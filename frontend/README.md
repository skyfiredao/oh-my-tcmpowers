# 中医之心 Web Frontend

**[中文文档](README_zh.md)**

A single-file web consultation interface for TCM (Traditional Chinese Medicine) analysis. Connects to [OpenCode](https://opencode.ai)'s HTTP API to dispatch TCM analysis agents and stream results back in real time via SSE.

## Features

- **Questionnaire (问诊单)**: 19 symptom categories (sleep, cold/heat, sweating, diet, etc.) plus basic info (gender, age group, birth date, occupation), loaded from `wenzhendan.json` at runtime
- **Symptom-only entry**: All analysis is initiated through the questionnaire's "Quick Submit" or "Submit Questionnaire" buttons — no free-form chat input
- **SSE streaming**: Receives AI analysis process and results via Server-Sent Events, rendered incrementally
- **Session management**: Create, switch, and delete sessions; sessions are isolated by workspace directory
- **Agent selection**: Lists available agents (omtp-agent sorted first); selected agent is used for the next message
- **Skill list**: Displays installed skills (omtp- sorted first) for frontend validation
- **Markdown rendering**: Full Markdown support in AI responses (headings, lists, tables, code blocks, etc.)
- **Message folding**: 2+ consecutive assistant process messages are auto-collapsed, showing only the last one; click to expand
- **Debug panel**: Tool calls, agent events, and other debug info displayed in a separate panel
- **Dark/light theme**: One-click toggle, preference saved to localStorage
- **Security hardening**: DOMPurify HTML sanitization, SRI for CDN resources, CSP meta tag, password in sessionStorage, protocol validation, SSE reconnect limit

## Quick Start

### 1. Start OpenCode server (required)

```bash
opencode serve
```

Default address: `http://localhost:4096`.

To enable password authentication (recommended for network access):

```bash
OPENCODE_SERVER_PASSWORD=yourpassword opencode serve
```

### 2. Serve the frontend files

```bash
cd oh-my-tcmpowers/frontend
python3 -m http.server 9090
```

Open `http://localhost:9090` in your browser.

### 3. Configure connection

On first visit, fill in the settings panel:

- **Server URL**: OpenCode server address (default `http://localhost:4096`)
- **Directory**: Path to the oh-my-tcmpowers project (for locating agents and skills)
- **Password** (optional): If OpenCode server has password authentication enabled

## Network Access

By default, `opencode serve` binds to `127.0.0.1` and only allows CORS from `localhost` origins. For access from other machines:

1. Set `OPENCODE_SERVER_PASSWORD` to protect the API
2. Bind to all interfaces with `--hostname 0.0.0.0`
3. Add your frontend origin to the CORS allowlist with `--cors`
4. Update the server URL in the frontend settings panel

```bash
OPENCODE_SERVER_PASSWORD=yourpassword opencode serve \
  --hostname 0.0.0.0 \
  --cors http://192.168.1.100:9090
```

Or via config file (`opencode.json` or `~/.config/opencode/config.json`):

```jsonc
{
  "server": {
    "hostname": "0.0.0.0",
    "cors": ["http://192.168.1.100:9090"]
  }
}
```

> **Notes on CORS configuration:**
> - Origins must be exact strings including protocol and port (e.g. `http://192.168.1.100:9090`), no wildcards
> - `--cors` can be repeated for multiple origins: `--cors http://A --cors http://B`
> - CLI flags and config file values are merged (not overridden)

## Files

```
frontend/
├── index.html          # Single-file frontend (HTML + CSS + JS)
├── wenzhendan.json     # Questionnaire data (19 symptom categories)
├── README.md           # English documentation
└── README_zh.md        # Chinese documentation
```

## Notes

- Requires HTTP access (not `file://`) because it connects to the OpenCode API
- Questionnaire data is loaded from `wenzhendan.json` at runtime with no inline fallback
- Internal compaction messages are filtered from the main chat view
- Green-toned UI with orange brand accent

## License

GPL-3.0
