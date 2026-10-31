cask "kubeconfig" do
  version "0.2.0"
  sha256 "094e93446cde2d97f6e9c575c2f991f03006c468b5515ca6a33363a24f1e51d2"

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
