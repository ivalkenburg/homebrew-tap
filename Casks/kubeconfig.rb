cask "kubeconfig" do
  version "0.5.0"
  sha256 "6aec1b99461d78953c54e709de12a702324a82551db6cb7f8900c8d86269462c"

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
