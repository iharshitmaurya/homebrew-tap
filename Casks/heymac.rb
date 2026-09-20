cask "heymac" do
  version "1.0.0"
  sha256 "7a1d84ff73ff65fcc13f4f705f516703991cf8c68d28d6c8296ca836b3f3bd8a"

  url "https://github.com/iharshitmaurya/HeyMac/releases/download/v#{version}/HeyMac-#{version}.dmg"
  name "Hey Mac"
  desc "Face unlock for the lock screen, plus App Lock"
  homepage "https://github.com/iharshitmaurya/HeyMac"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "HeyMac.app"

  uninstall quit: "com.heymac.app"

  zap trash: [
    "~/Library/Application Support/HeyMac",
    "~/Library/Caches/com.heymac.app",
    "~/Library/HTTPStorages/com.heymac.app",
    "~/Library/Logs/HeyMac.log",
    "~/Library/Preferences/com.heymac.app.plist",
  ]

  caveats <<~EOS
    Hey Mac is not notarized. If macOS blocks it, open System Settings > Privacy & Security and click Open Anyway.
    To remove everything, including your face data and saved password, use Settings > About > Uninstall in the app.
  EOS
end
