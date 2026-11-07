class Shlog < Formula
  desc "Inspect and clean up zsh, bash and fish shell history"
  homepage "https://github.com/ivalkenburg/shlog"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.0.5/shlog-darwin-arm64"
      sha256 "6e912abb9b32b3b90d3ab1dc719e03ef90a91dc2f09b37119949a32f31c072ed"
    end
    on_intel do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.0.5/shlog-darwin-amd64"
      sha256 "c48cdaa5b336f9940e3e75b390bccbefbcc9bcee2ee5d52a0429e5ec51164d7f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.0.5/shlog-linux-arm64"
      sha256 "1494c975ee3830f912ada25213d49e924394eeb024e8c7b04269d75c5652ec00"
    end
    on_intel do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.0.5/shlog-linux-amd64"
      sha256 "865933874ec13027c802bbf37be96ac525c126c717e9e20b089de9f915866730"
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
