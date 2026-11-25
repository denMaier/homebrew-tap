cask "palot" do
  # Upstream file names carry the commit and build number: version, commit, build.
  version "0.23.0,62e36fd61502,20"
  sha256 "3fc14dc717641e2da10f6882b0b034bead52280c2f5e7c321822a64448e4b877"

  url "https://github.com/ItsWendell/palot/releases/download/v#{version.csv.first}/Palot-#{version.csv.first}-stable-#{version.csv.second}-build-#{version.csv.third}-mac-arm64.dmg"
  name "Palot"
  desc "Desktop client for OpenCode, an AI-powered coding assistant"
  homepage "https://github.com/ItsWendell/palot"

  livecheck do
    url :url
    strategy :github_latest do |json|
      json["assets"]&.filter_map do |asset|
        match = asset["name"]&.match(/^Palot-(\d+(?:\.\d+)+)-stable-(\h+)-build-(\d+)-mac-arm64\.dmg$/i)
        "#{match[1]},#{match[2]},#{match[3]}" if match
      end
    end
  end

  auto_updates true
  depends_on arch: :arm64

  app "Palot.app"
end
