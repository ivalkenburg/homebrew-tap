class Shlog < Formula
  desc "Inspect and clean up zsh, bash and fish shell history"
  homepage "https://github.com/ivalkenburg/shlog"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.0.2/shlog-darwin-arm64"
      sha256 "087cc6a7f74802b8e6b0462c92dbb82e3a28d74b4c6df6cbecdaf2f7606207b6"
    end
    on_intel do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.0.2/shlog-darwin-amd64"
      sha256 "a532fbc3d6c37e1315f411082133aa07c3be2e99fa45c0db9047285192bfc685"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.0.2/shlog-linux-arm64"
      sha256 "ade807ade6519a0195fe8f25714fae3f1a3fb73c095c82fe2f10708035a7e39d"
    end
    on_intel do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.0.2/shlog-linux-amd64"
      sha256 "f55cfc21062f6a3c0e75f13de85942f28cf109a34ba85cbdc45a2857a54062bc"
    end
  end

  def install
    bin.install Dir["shlog-*"].first => "shlog"
    chmod 0755, bin/"shlog"
    generate_completions_from_executable(bin/"shlog", "completion")
  end

  def caveats
    <<~EOS
      `shlog pick` and `shlog del --pick` need fzf:
        brew install fzf
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/shlog version").strip
  end
end
