cask "openchamber" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.8.7"
  sha256 arm: "7f14c120ff02cf8fe1289083142e1ad403ec7ac2b7863e276dae379f55f2f40f",
         intel: "e6e41c9f498dba5352905b12abbd407cb70cb16d9b590dea2d30d0eb9cc2010c"

  url "https://github.com/openchamber/openchamber/releases/download/v#{version}/OpenChamber_#{version}_darwin-#{arch}.dmg"
  name "OpenChamber"
  desc "Desktop and web interface for OpenCode AI agent"
  homepage "https://github.com/openchamber/openchamber"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  auto_updates true

  app "OpenChamber.app"
end
