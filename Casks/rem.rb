cask "rem" do
  arch arm: "arm64", intel: "x64"

  version "1.2.0"
  sha256 arm: "e4a4157f823752d0a5c3113f729e785d9f3b5a2c681f5a2b9720c27ff038f48eb7",
         intel: "b317166be47b1955d75b06ab345103be976e63b2c1d113d8f6b620b761370a95"
    
  url "https://github.com/liriliri/rem/releases/download/v#{version}/REM-#{version}-mac-#{arch}.dmg"
  name "REM"
  desc "REM is a desktop application based on Rclone. It allows you to browse, organize, and transfer files across your cloud storages effortlessly."
  homepage "https://github.com/liriliri/rem"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  app "rem.app"
end
