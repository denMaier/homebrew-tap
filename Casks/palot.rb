cask "palot" do
  arch arm: "arm64", intel: "x64"

  version "0.11.0"
  sha256 arm: "8803ad7b83c1ef1dc2efe912a5a3aba5ee6906520b71b96a9809e5efbb7b11c1",
         intel: "f57d0a9ef76dcec5bc5141022208dd9b078bab879951fd1d3321cad817646e95"

  url "https://github.com/ItsWendell/palot/releases/download/v#{version}/Palot-#{version}-mac-#{arch}.dmg"
  name "Palot"
  desc "Desktop client for OpenCode, an AI-powered coding assistant"
  homepage "https://github.com/ItsWendell/palot"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  auto_updates true

  app "Palot.app"
end
