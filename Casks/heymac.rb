cask "heymac" do
  version "1.0.6"
  sha256 "8871c6fd239fdba1f599ab5170f5226913524e8ca964d774e8b70d397afae534"

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
