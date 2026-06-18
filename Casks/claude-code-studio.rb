cask "claude-code-studio" do
  arch arm: "arm64", intel: "x64"

  version "5.64.0"
  sha256 arm:   "a15f6b4cb25867d64d3d7e9daebe7aa86bd0aa7a2b74b9f997d7e03325490455",
         intel: "29d98a95beae74aaffbf839b4880ea31b86fb2279ff7b92527d8b2b7f8a53d43"

  url "https://github.com/Lexus2016/claude-code-studio/releases/download/v#{version}/claude-code-studio-#{version}-#{arch}.dmg"
  name "Claude Code Studio"
  desc "Desktop app for Claude Code — chat, multi-agent, MCP, skills"
  homepage "https://github.com/Lexus2016/claude-code-studio"

  depends_on macos: :catalina

  app "Claude Code Studio.app"

  # The app updates itself in-app via `brew upgrade --cask` (no Sparkle/Squirrel),
  # so let brew manage the version normally.
  auto_updates false

  # Strip quarantine so the unsigned app opens without a Gatekeeper block.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Claude Code Studio.app"],
                   sudo: false
  end

  uninstall quit: "studio.claudecode.app"

  zap trash: [
    "~/Library/Application Support/claude-code-studio",
  ]
end
