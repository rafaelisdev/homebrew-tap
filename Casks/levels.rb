# Template for Casks/levels.rb in the OWNER/homebrew-tap repo.
# scripts/publish.sh fills in rafaelisdev, 1.2 and 424703a98a2fcc163a9e37d536849940fed2b0c9631e26a05e3cf2bad6dee71d.
#   brew install rafaelisdev/tap/levels
cask "levels" do
  version "1.2"
  sha256 "424703a98a2fcc163a9e37d536849940fed2b0c9631e26a05e3cf2bad6dee71d"

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
