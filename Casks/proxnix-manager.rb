cask "proxnix-manager" do
  version "0.5.0"
  sha256 "8aff658d075cc78c36798fd47b5e3a422262f06fa81c0795b48f86c58c073418"

  url "https://github.com/denMaier/proxnix/releases/download/v0.5.0/proxnix-manager-#{version}-macos-arm64.dmg"
  name "Proxnix Manager"
  desc "macOS GUI for proxnix"
  homepage "https://github.com/denMaier/proxnix"

  depends_on formula: "python@3.12"
  depends_on formula: "sops"
  depends_on macos: ">= :ventura"

  app "Proxnix Manager.app"
  binary "#{appdir}/Proxnix Manager.app/Contents/Resources/bin/proxnix"
  binary "#{appdir}/Proxnix Manager.app/Contents/Resources/bin/proxnix-publish"
  binary "#{appdir}/Proxnix Manager.app/Contents/Resources/bin/proxnix-secrets"
  binary "#{appdir}/Proxnix Manager.app/Contents/Resources/bin/proxnix-doctor"
  binary "#{appdir}/Proxnix Manager.app/Contents/Resources/bin/proxnix-lxc-exercise"
  binary "#{appdir}/Proxnix Manager.app/Contents/Resources/bin/proxnix-tui"

  caveats do
    <<~EOS
      Installed commands:
        proxnix
        proxnix-publish
        proxnix-secrets
        proxnix-doctor
        proxnix-lxc-exercise
        proxnix-tui

      Runtime tools still expected from the system:
        ssh
        rsync

      Unsigned test builds are ad-hoc signed so they usually reach the
      Privacy & Security "Open Anyway" approval path. If this cask is rendered
      from an unsigned test build and macOS still refuses to open it, remove
      quarantine for the installed app:
        xattr -dr com.apple.quarantine "#{appdir}/Proxnix Manager.app"

      Release builds should be Developer ID signed and notarized before the
      cask is published for general use.
    EOS
  end
end
