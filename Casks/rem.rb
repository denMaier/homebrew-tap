cask "rem" do
  arch arm: "arm64", intel: "x64"

  version "1.1.0"
  sha256 arm: "sha256:b717166be47b1955d75b06ab345103be976e63b2c1d113d8f6b620b761370a95",
         intel: "sha256:73dcd7c913c96378548a2446473d3162f8c036c68f5a2b9720c27ff038f48eb7"
    
  url "https://github.com/liriliri/rem/releases/download/v#{version}/REM-#{version}-mac-#{arch}.dmg"
  name "REM"
  desc "REM is a desktop application based on Rclone. It allows you to browse, organize, and transfer files across your cloud storages effortlessly."
  homepage "https://github.com/liriliri/rem"

  app "rem.app"
end


