# Template for Casks/levels.rb in the OWNER/homebrew-tap repo.
# scripts/publish.sh fills in rafaelisdev, 1.4 and f360828fd12db5423ba294285e10405d7c7b567cfdfccb3cade9794e81e2b861.
#   brew install rafaelisdev/tap/levels
cask "levels" do
  version "1.4"
  sha256 "f360828fd12db5423ba294285e10405d7c7b567cfdfccb3cade9794e81e2b861"

  url "https://github.com/rafaelisdev/levels/releases/download/v#{version}/Levels.zip"
  name "Levels"
  desc "Per-app volume control in the menu bar"
  homepage "https://github.com/rafaelisdev/levels"

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
