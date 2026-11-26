cask "palot" do
  # Upstream file names carry the commit and build number: version, commit, build.
  version "0.24.0,d716301b816b,23"
  sha256 "29892863d4bc854e18d0eb631c4a25cf951cc02131f472f2587d266f6b8af434"

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
