cask "proxnix-manager" do
  version "0.1.0"
  sha256 "9074302aa14593c9de1b9916e71b02db149f1222834f9fb8c5229527415b4efb"

  url "https://github.com/denMaier/proxnix/releases/download/v0.1.0/proxnix-manager-#{version}-macos-arm64.dmg"
  name "Proxnix Manager"
  desc "macOS GUI for proxnix"
  homepage "https://github.com/denMaier/proxnix"

  depends_on formula: "python@3.12"
  depends_on formula: "sops"
  depends_on macos: ">= :ventura"

  app "Proxnix Manager.app"

  caveats do
    <<~EOS
      ProxnixManager expects these system tools to be available:
        ssh
        rsync
    EOS
  end
end
