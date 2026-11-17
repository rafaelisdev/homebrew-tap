# Template for Casks/levels.rb in the OWNER/homebrew-tap repo.
# scripts/publish.sh fills in rafaelisdev, 2.0.1 and 0ad414c0d404ee2998da788296ba62fe908fb7a07390ffe4eaec9e321a8dfcbf.
#   brew install rafaelisdev/tap/levels
cask "levels" do
  version "2.0.1"
  sha256 "0ad414c0d404ee2998da788296ba62fe908fb7a07390ffe4eaec9e321a8dfcbf"

  url "https://github.com/rafaelisdev/levels/releases/download/v#{version}/Levels.zip"
  name "Levels"
  desc "Per-app volume control in the menu bar"
  homepage "https://getlevels.app"

  # Levels updates itself since 1.4.1 (signed update.json in every release), so
  # `brew upgrade` leaves it alone. Installs of 1.4 update once with `brew upgrade --greedy`.
  auto_updates true

  depends_on macos: :big_sur

  app "Levels.app"

  # Needed while releases aren't notarized: without it macOS refuses to open the app
  # on first launch. Drop it once releases are signed with Developer ID.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Levels.app"]
  end

  uninstall quit: "io.github.rafaelisdev.levels"

  zap trash: [
    "~/Library/Preferences/io.github.rafaelisdev.levels.plist",
    "~/Library/Preferences/local.volumemixer.plist",
  ]
end
