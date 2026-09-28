# Homebrew Tap — Claude Code Studio

Homebrew tap for the **[Claude Code Studio](https://github.com/Lexus2016/claude-code-studio)**
macOS desktop app (a native window around the full Studio — chat, Kanban, agents, MCP, skills).

## Install

```bash
brew install --cask Lexus2016/claude-code-studio/claude-code-studio
```

Apple Silicon only.

> **This tap is transitional and will be retired about a month after v7.18.0.**
> From v7.18.0 the app is a signed, notarized `.dmg` on
> [GitHub Releases](https://github.com/Lexus2016/claude-code-studio/releases/latest) and updates
> itself. Versions before it update by running `brew upgrade --cask claude-code-studio` — that is
> the one thing this tap is kept for.

**Prerequisite:** the [Claude Code CLI](https://docs.anthropic.com/en/claude-code) installed and
logged in (Claude Pro or Max). The app detects it on first launch.

---

The cask here is bumped automatically on each release by the
[`release-desktop.yml`](https://github.com/Lexus2016/claude-code-studio/blob/main/.github/workflows/release-desktop.yml)
workflow in the main repo.
