# Template for Casks/levels.rb in the OWNER/homebrew-tap repo.
# scripts/publish.sh fills in rafaelisdev, 1.4.1 and 188750fee8cc04e498f847307adfe04f4c615a737a333a842ce771ff90ce5197.
#   brew install rafaelisdev/tap/levels
cask "levels" do
  version "1.4.1"
  sha256 "188750fee8cc04e498f847307adfe04f4c615a737a333a842ce771ff90ce5197"

  url "https://github.com/rafaelisdev/levels/releases/download/v#{version}/Levels.zip"
  name "Levels"
  desc "Per-app volume control in the menu bar"
  homepage "https://github.com/rafaelisdev/levels"

  # Levels updates itself since 1.4.1 (signed update.json in every release). Add
  # `auto_updates true` here from the next release on: until then `brew upgrade` must
  # still reach installs of 1.4, which can't update themselves.

  depends_on macos: :big_sur

  app "Levels.app"

  # The app is not notarized; without this macOS refuses to open it on first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Levels.app"]
  end

  uninstall quit: "io.github.rafaelisdev.levels"

  zap trash: [
    "~/Library/Preferences/io.github.rafaelisdev.levels.plist",
    "~/Library/Preferences/local.volumemixer.plist",
  ]
end
