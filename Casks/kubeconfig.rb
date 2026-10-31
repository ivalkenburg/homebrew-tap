cask "kubeconfig" do
  version "0.3.0"
  sha256 "950cc1c0eb7ba9cdb7cdc601c99f9d7d0dfa6a9f5e7b1e7b4b2d4e0fd8f8c2eb"

  url "https://github.com/ivalkenburg/kubeconfig/releases/download/v#{version}/KubeConfig-#{version}.dmg"
  name "KubeConfig"
  desc "Edit, import and roll back a local kubeconfig"
  homepage "https://github.com/ivalkenburg/kubeconfig"

  depends_on macos: :tahoe

  app "KubeConfig.app"

  uninstall quit: "com.igorv.kubeconfig"

  zap trash: [
    "~/Library/Application Support/KubeConfig",
    "~/Library/Preferences/com.igorv.kubeconfig.plist",
  ]

  caveats <<~EOS
    KubeConfig is not notarized by Apple, so macOS blocks its first launch.
    Allow it once with:
      xattr -dr com.apple.quarantine /Applications/KubeConfig.app
    or open it, then click "Open Anyway" in
    System Settings > Privacy & Security.
  EOS
end
