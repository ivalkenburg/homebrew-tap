class Shlog < Formula
  desc "Inspect and clean up zsh, bash and fish shell history"
  homepage "https://github.com/ivalkenburg/shlog"
  license all_of: ["MIT", "Unicode-3.0"]

  on_macos do
    on_arm do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.1.0/shlog-darwin-arm64"
      sha256 "8554048109cd73ffb52a413dfa80b5b5f3be3a26d00d77dc11d7bef76aa581c0"
    end
    on_intel do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.1.0/shlog-darwin-amd64"
      sha256 "defa53c861dda0902f9d909e7e8edc0711483e984795ae7d762bf9a77f2251f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.1.0/shlog-linux-arm64"
      sha256 "3c098f3863e8c161a46cdbd9f2542187a0e3a074ae2df5082beb30b1cec2a786"
    end
    on_intel do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.1.0/shlog-linux-amd64"
      sha256 "03b61ec610468e92b024f5bed8d60ec4f8f904726c82221f9d00fc847e88c53f"
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
