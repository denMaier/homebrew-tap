cask "rem" do
  arch arm: "arm64", intel: "x64"

  version "1.5.0"
  sha256 arm: "4ab4fe6fc837a624697c2294625def9b56d3620da0df04ff7a090fcda22412d1",
         intel: "86f9d01b3c48a9c15156337bb0e1bbe3ccbbf907920885481f5177ab7c210ca6"
  url "https://github.com/liriliri/rem/releases/download/v#{version}/REM-#{version}-mac-#{arch}.dmg"
  name "REM"
  desc "REM is a desktop application based on Rclone. It allows you to browse, organize, and transfer files across your cloud storages effortlessly."
  homepage "https://github.com/liriliri/rem"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "rem.app"
end
