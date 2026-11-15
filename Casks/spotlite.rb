cask "spotlite" do
  version "1.2.0"
  sha256 "f09ef03e65cfab5cdf0afb0f9f1bac2da40bb2864a0b3143d10c8cb8c859874b"

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
