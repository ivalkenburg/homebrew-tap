cask "spotlite" do
  version "1.0.0"
  sha256 "6cdf0453f10d095bb8f57d6bb6d02f2a45cbaddbb11a3b2d12214f8ed577d395"

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
