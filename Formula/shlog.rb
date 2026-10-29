class Shlog < Formula
  desc "Inspect and clean up zsh, bash and fish shell history"
  homepage "https://github.com/ivalkenburg/shlog"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.0.4/shlog-darwin-arm64"
      sha256 "cc3a03d996aa42faee07d8d97ea641d6072ef76cc7d55a8fa13c500ac34690fc"
    end
    on_intel do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.0.4/shlog-darwin-amd64"
      sha256 "f3e4a125e2f0d55cb5df2151a7480f174fd072bccaca3bd9378676ca1c9c39df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.0.4/shlog-linux-arm64"
      sha256 "d6fa10bda49696fbbc7073a68dfb69bcb82463f47809962bfbb546d766c28673"
    end
    on_intel do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.0.4/shlog-linux-amd64"
      sha256 "2befe534194fe286d667ddc0ffd5181c4c6e2625b5985be139559df10836f37e"
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
