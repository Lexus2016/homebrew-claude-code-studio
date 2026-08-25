cask "claude-code-studio" do
  arch arm: "arm64", intel: "x64"

  version "7.9.0"
  sha256 arm:   "62892a498cddfeb90f4f9c65a5c3ca02a8a976d35d6dfa4d1c0074d6679e4e20",
         intel: "2b482e0bd666737660c5a940bb707e8e3591bf41fad38194b3c63598e58892de"

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
