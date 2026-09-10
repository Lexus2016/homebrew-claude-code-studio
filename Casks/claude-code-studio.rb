cask "claude-code-studio" do
  arch arm: "arm64", intel: "x64"

  version "7.16.2"
  sha256 arm:   "aac15b06f0398b0f0b8f8d9706f780a523fc0a8d898a7a8424dbea7a333421e0",
         intel: "c0b44e30350cad81819a675fee109e247f0b00e1a8b58190fa08f170b1ffc957"

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
