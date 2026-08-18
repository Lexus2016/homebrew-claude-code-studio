cask "claude-code-studio" do
  arch arm: "arm64", intel: "x64"

  version "7.1.1"
  sha256 arm:   "ed9a13e956777b8e68134c68cadc1838c47d17fc3f04442bc5bbc325b56bd3f0",
         intel: "14cdedb23ec3c81998d0eaadc8b2e20740455cfff58fa4e65dfe74ec87b2bfe7"

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
