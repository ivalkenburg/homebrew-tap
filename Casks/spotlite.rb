cask "spotlite" do
  version "0.5.0"
  sha256 "4fdb955acddacb660bc250293b94413427492b2ce5a39d4285d3ef70fb7b375a"

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
