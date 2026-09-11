cask "claude-code-studio" do
  arch arm: "arm64", intel: "x64"

  version "7.17.0"
  sha256 arm:   "0a97af0a3ecb2a46ddc8501cb41c6da6c55dc39e62519eb7ff3a63a721d9b5cd",
         intel: "b8032eabafffcb6f3b949d56ec77a4287cb5d0779a37fb3f6ee56a2b02a5ca1e"

  url "https://github.com/Lexus2016/claude-code-studio/releases/download/v#{version}/claude-code-studio-#{version}-#{arch}.dmg"
  name "Claude Code Studio"
  desc "Desktop app for Claude Code — chat, multi-agent, MCP, skills"
  homepage "https://github.com/Lexus2016/claude-code-studio"

  depends_on macos: :big_sur

  app "Claude Code Studio.app"

  # The app updates itself in-app via `brew upgrade --cask` (no Sparkle/Squirrel),
  # so let brew manage the version normally.
  auto_updates false

  # Strip quarantine so the unsigned app opens without a Gatekeeper block.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Claude Code Studio.app"]
  end

  uninstall quit: "studio.claudecode.app"

  zap trash: [
    "~/Library/Application Support/claude-code-studio",
  ]
end
