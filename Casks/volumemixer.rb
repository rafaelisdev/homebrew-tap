# Template for Casks/volumemixer.rb in the OWNER/homebrew-tap repo.
# scripts/publish.sh fills in rafaelisdev, 1.1 and e7e921f79d511055ed7e21436965b9dbe4a6b28b0d9a23756fa65e89e997da0e.
#   brew install rafaelisdev/tap/volumemixer
cask "volumemixer" do
  version "1.1"
  sha256 "e7e921f79d511055ed7e21436965b9dbe4a6b28b0d9a23756fa65e89e997da0e"

  url "https://github.com/rafaelisdev/volumemixer/releases/download/v#{version}/VolumeMixer.zip"
  name "VolumeMixer"
  name "Микшер"
  desc "Per-app volume control in the menu bar"
  homepage "https://github.com/rafaelisdev/volumemixer"

  depends_on macos: :big_sur

  app "VolumeMixer.app"

  # The app is not notarized; without this macOS refuses to open it on first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/VolumeMixer.app"]
  end

  uninstall quit: "local.volumemixer"

  zap trash: "~/Library/Preferences/local.volumemixer.plist"
end
