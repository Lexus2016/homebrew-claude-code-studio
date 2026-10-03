cask "claude-code-studio" do
  version "7.18.2"
  sha256 "b2d6cb0c73eee9349213436a975ad26b043e343f9ecc0ba770b75de5c85e54ac"

  url "https://github.com/Lexus2016/claude-code-studio/releases/download/v#{version}/claude-code-studio-#{version}-arm64.dmg"
  name "Claude Code Studio"
  desc "Desktop app for Claude Code — chat, multi-agent, MCP, skills"
  homepage "https://github.com/Lexus2016/claude-code-studio"

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Claude Code Studio.app"

  # TRANSITIONAL — retire ~2026-10-28 (docs/electron-desktop/MAC-SIGNING.md in the app repo).
  # Releases before the signed one update by running `brew upgrade --cask`; this cask is
  # how they reach it. Later releases update themselves (signed, Squirrel.Mac).
  # auto_updates stays false so a plain `brew upgrade` still moves those installs forward.
  auto_updates false

  # Harmless on the signed app; kept while the cask can still point at an unsigned release.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Claude Code Studio.app"]
  end

  uninstall quit: "studio.claudecode.app"

  zap trash: [
    "~/Library/Application Support/claude-code-studio",
  ]
end
