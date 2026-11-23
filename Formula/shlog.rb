class Shlog < Formula
  desc "Inspect and clean up zsh, bash and fish shell history"
  homepage "https://github.com/ivalkenburg/shlog"
  license all_of: ["MIT", "Unicode-3.0"]

  on_macos do
    on_arm do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.4.1/shlog-darwin-arm64"
      sha256 "dcf9b71d47040d7c6dff1f4a935d518da6fb76df6ade1da888e8ab85c372543b"
    end
    on_intel do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.4.1/shlog-darwin-amd64"
      sha256 "db67316f0d4691d6e5144bf33218d6d5a4b569ac5ee1d7739b93c1b75701d04c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.4.1/shlog-linux-arm64"
      sha256 "68e4e8b2195e647618765bafa3b305e7c5375f98e567ba0b5977c659e27560c6"
    end
    on_intel do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.4.1/shlog-linux-amd64"
      sha256 "2d42c7c4c90170cea0dde46599d718d940b23c561a2feda9341af06be63a3551"
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
