cask "claude-code-studio" do
  arch arm: "arm64", intel: "x64"

  version "5.68.0"
  sha256 arm:   "2ce7abd8b017329b335ac48554454ed1170886610b6e0c48634d9f8a1d1ebdb3",
         intel: "70132c88537d698224508cf26c40cafb9a0a7b72d254eee5662e9066b164603c"

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
