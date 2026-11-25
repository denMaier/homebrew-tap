cask "learnharness" do
  version "0.7.0"
  sha256 "64ffab3cec0a49310fa7551335025d7078b7b57f2e283a26a17a4cdc4533e314"

  url "https://github.com/amosblomqvist/learnharness/releases/download/v#{version}/LearnHarness-#{version}-arm64.dmg"
  name "LearnHarness"
  desc "Agent harness for learning difficult things"
  homepage "https://github.com/amosblomqvist/learnharness"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "LearnHarness.app"

  uninstall quit: "com.learnharness.LearnHarness"

  zap trash: [
    "~/Library/Application Support/LearnHarness",
    "~/Library/Caches/com.learnharness.LearnHarness",
    "~/Library/Caches/com.learnharness.LearnHarness.ShipIt",
    "~/Library/Caches/learnharness-updater",
    "~/Library/HTTPStorages/com.learnharness.LearnHarness",
    "~/Library/Preferences/com.learnharness.LearnHarness.plist",
  ]
end
