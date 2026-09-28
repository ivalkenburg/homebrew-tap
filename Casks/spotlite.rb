cask "spotlite" do
  version "0.3.1"
  sha256 "0a87ac57d899e347e8f825e770c376f582bf33eac3d731ad57b388f6d69016a2"

  url "https://github.com/ivalkenburg/spotlite/releases/download/v#{version}/Spotlite-#{version}.dmg"
  name "Spotlite"
  desc "Lightweight application launcher"
  homepage "https://github.com/ivalkenburg/spotlite"

  depends_on macos: :tahoe

  app "Spotlite.app"

  uninstall quit:       "com.igorv.spotlite",
            login_item: "Spotlite"

  zap trash: [
    "~/Library/Application Support/Spotlite",
    "~/Library/Caches/Spotlite",
  ]

  caveats <<~EOS
    Spotlite is not notarized by Apple, so macOS blocks its first launch.
    Allow it once with:
      xattr -dr com.apple.quarantine /Applications/Spotlite.app
    or open it, then click "Open Anyway" in
    System Settings > Privacy & Security.
  EOS
end
