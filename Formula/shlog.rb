class Shlog < Formula
  desc "Inspect and clean up zsh, bash and fish shell history"
  homepage "https://github.com/ivalkenburg/shlog"
  license all_of: ["MIT", "Unicode-3.0"]

  on_macos do
    on_arm do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.4.0/shlog-darwin-arm64"
      sha256 "695fe53abb0f6c7fc040273f2fc4f313da71cc3d74d5d1f03c1a5c0b0c0f1e20"
    end
    on_intel do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.4.0/shlog-darwin-amd64"
      sha256 "523e11308cf60955d14b69009c0203f5cb64d5cc832cea06e590ddbc572bf3cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.4.0/shlog-linux-arm64"
      sha256 "9d35840d1ec3ec18d401f6c4cc6a88a1d9f89fed23414ba0c246e77165eb22ea"
    end
    on_intel do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.4.0/shlog-linux-amd64"
      sha256 "b75db5d21661a05900b44d0e29a4e16c8b9f747dcf5cab32718cc75a368d9739"
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
