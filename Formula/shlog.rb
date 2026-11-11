class Shlog < Formula
  desc "Inspect and clean up zsh, bash and fish shell history"
  homepage "https://github.com/ivalkenburg/shlog"
  license all_of: ["MIT", "Unicode-3.0"]

  on_macos do
    on_arm do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.3.0/shlog-darwin-arm64"
      sha256 "2ab5ca6682ed9a17cf84dde51692068410405ccca86733a2c91e7b0f74083d2f"
    end
    on_intel do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.3.0/shlog-darwin-amd64"
      sha256 "3a0e35abec7a7816dfd7e1a71ea3e28bb90c6b33999460bf1ff595ec893b8a0f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.3.0/shlog-linux-arm64"
      sha256 "981abf633fbe6ee990c6eb51e23653f10ee7cc2f23de859712572213c21dda76"
    end
    on_intel do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.3.0/shlog-linux-amd64"
      sha256 "bab0e2be448d3a8f0e3628058edc988091e6a4afd0a09ae7eab98c2f1ac711b2"
    end
  end

  def install
    bin.install Dir["shlog-*"].first => "shlog"
    chmod 0755, bin/"shlog"
    generate_completions_from_executable(bin/"shlog", "completion")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/shlog version").strip
  end
end
