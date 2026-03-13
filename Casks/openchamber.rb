class Myapp < Formula
  desc "Description of the GitHub project"
  homepage "https://github.com/OWNER/REPO_NAME"

  # Use a stable URL for the initial installation. This will be updated by livecheck.
  # You can find the URL of a recent .dmg from the GitHub releases page.
  url "https://github.com/OWNER/REPO_NAME/releases/download/v1.2.3/REPO_NAME-1.2.3.dmg"
  sha256 "SHA256_HASH_OF_THE_DMG" # Run `shasum -a 256 path/to.dmg` to get this

  # This block tells Homebrew how to check for new versions
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i) # Matches tags like "v1.2.3" or "1.2.3"
  end

  def install
    # Since we are downloading a pre-built .dmg, the install is much simpler.
    # We just need to mount it and copy the .app bundle.
    dmg_path = cached_download

    # Mount the DMG
    system "hdiutil", "attach", dmg_path

    # Find the mounted volume and the .app inside it
    # The volume name is often the same as the .dmg name without the extension
    dmg_name = File.basename(dmg_path, ".dmg")
    mounted_volume = Dir.glob("/Volumes/#{dmg_name}*").first
    app_bundle = Dir.glob("#{mounted_volume}/*.app").first

    # Copy the .app to the Caskroom
    target = prefix / app_bundle.basename
    FileUtils.cp_r(app_bundle, target)

    # Unmount the DMG
    system "hdiutil", "detach", mounted_volume
  end

  def caveats
    <<~EOS
      The application was installed to:
        #{opt_prefix}

      You can create a symlink in your Applications folder:
        ln -s #{opt_prefix}/*.app /Applications/
    EOS
  end
end
