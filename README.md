# Homebrew Tap for Claude Code Studio

This repository contains the Homebrew cask for the [Claude Code Studio](https://github.com/Lexus2016/claude-code-studio) macOS desktop app. Application source, features and release notes live in the main repository.

## Recommended installation

Download the signed, notarized macOS `.dmg` from [Claude Code Studio releases](https://github.com/Lexus2016/claude-code-studio/releases/latest). Signed desktop versions from v7.18.0 support in-app updates.

This tap is transitional: it provides an upgrade path for older Homebrew installations. The cask remains present, but this repository is not a promise of long-term Homebrew distribution.

## Install with Homebrew

Requirements for the current [cask](Casks/claude-code-studio.rb):

- Apple silicon (ARM64); this cask does not provide an Intel build.
- macOS Monterey 12 or newer.
- [Homebrew](https://brew.sh).
- The [Claude Code CLI](https://docs.anthropic.com/en/claude-code), installed and authenticated before using the app.

```bash
brew install --cask Lexus2016/claude-code-studio/claude-code-studio
```

To update an existing Homebrew installation to the version offered by the tap:

```bash
brew update
brew upgrade --cask Lexus2016/claude-code-studio/claude-code-studio
```

## Support and maintenance

- Report installation, download or checksum problems in [this repository's issues](https://github.com/Lexus2016/homebrew-claude-code-studio/issues). Include macOS, architecture, Homebrew version and a redacted error.
- Report application behavior in [Claude Code Studio issues](https://github.com/Lexus2016/claude-code-studio/issues).
- The [desktop release workflow](https://github.com/Lexus2016/claude-code-studio/blob/main/.github/workflows/release-desktop.yml) updates the cask. Changes must match an existing release asset and its SHA-256.

On a supported Mac, check proposed cask changes with:

```bash
brew style Casks/claude-code-studio.rb
brew audit --cask Lexus2016/claude-code-studio/claude-code-studio
```

This tap has no license file. Do not assume the application's license also covers the tap; consult the main repository for the application's terms.
