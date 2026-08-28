cask "claude-code-studio" do
  arch arm: "arm64", intel: "x64"

  version "7.15.0"
  sha256 arm:   "ab8826bd45ab1372cb893e78aa6adad13e4042f36b149b7d11ffec034d35f634",
         intel: "7fd30b6497d9ab642862bfefdbc7e01fd2b1883aa81ebf26aa884a3e9f6e15c9"

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
