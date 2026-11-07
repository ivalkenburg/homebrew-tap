cask "kubeconfig" do
  version "0.6.1"
  sha256 "d77b619ecbfcb9a23175a7a670acea4511778827d2b274dd5c9d24c6b8ff9c28"

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
