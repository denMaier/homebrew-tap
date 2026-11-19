cask "obry" do
  version "1.3.2"
  sha256 "7364468f33dc8f1d33f68a956434bc2c61666f41c296cdf3105235d3322e03c0"

  url "https://github.com/sneqqy/obry/releases/download/v#{version}/Obry.dmg"
  name "Obry"
  desc "Menu bar app that turns screen captures into floating, dockable cards"
  homepage "https://obry.app/"

  livecheck do
    url "https://raw.githubusercontent.com/sneqqy/obry/main/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Obry.app"

  uninstall quit: "app.obry.mac"

  zap trash: [
    "~/Library/Application Support/Obry",
    "~/Library/Caches/app.obry.mac",
    "~/Library/HTTPStorages/app.obry.mac",
    "~/Library/Preferences/app.obry.mac.plist",
    "~/Library/Saved Application State/app.obry.mac.savedState",
    "~/Library/WebKit/app.obry.mac",
  ]
end
