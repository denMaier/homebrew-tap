cask "proxnix-manager" do
  version "0.5.1"
  sha256 "e45d66f3fb3d73dad70dd98122fc2c0e1fd41c97a584e6984552a67c9e1acdc5"

  url "https://github.com/denMaier/proxnix/releases/download/v0.5.1/proxnix-manager-#{version}-macos-arm64.dmg"
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
