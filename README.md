# Homebrew Tap — Claude Code Studio

Homebrew tap for the **[Claude Code Studio](https://github.com/Lexus2016/claude-code-studio)**
macOS desktop app (a native window around the full Studio — chat, Kanban, agents, MCP, skills).

## Install

```bash
brew install --cask Lexus2016/claude-code-studio/claude-code-studio
```

Works on Apple Silicon and Intel. Updates happen **in-app** (the app runs
`brew upgrade --cask claude-code-studio` for you), or run that command yourself.

**Prerequisite:** the [Claude Code CLI](https://docs.anthropic.com/en/claude-code) installed and
logged in (Claude Pro or Max). The app detects it on first launch.

---

The cask here is bumped automatically on each release by the
[`release-desktop.yml`](https://github.com/Lexus2016/claude-code-studio/blob/main/.github/workflows/release-desktop.yml)
workflow in the main repo.
