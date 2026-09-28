class Shlog < Formula
  desc "Inspect and clean up zsh, bash and fish shell history"
  homepage "https://github.com/ivalkenburg/shlog"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.0.3/shlog-darwin-arm64"
      sha256 "740f4f1d33311f804f2a0964ea56659a6b465d7cd5fa23793aa9a60740c5429f"
    end
    on_intel do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.0.3/shlog-darwin-amd64"
      sha256 "d31017b0a38dd60f2699acc12843b2867721ab8e43d02f86e012dbadb6431453"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.0.3/shlog-linux-arm64"
      sha256 "937f99f5d57d900678da6de079976ac5e01e3f73188c9a026095e4ec0a2d141b"
    end
    on_intel do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.0.3/shlog-linux-amd64"
      sha256 "716fbd79b0c0d451b5eb76d8e124005ea75c37f74623dc9db5fa5e1c239476ef"
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
