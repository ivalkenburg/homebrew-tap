class Shlog < Formula
  desc "Inspect and clean up zsh, bash and fish shell history"
  homepage "https://github.com/ivalkenburg/shlog"
  license all_of: ["MIT", "Unicode-3.0"]

  on_macos do
    on_arm do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.2.0/shlog-darwin-arm64"
      sha256 "d3ae90c92136e70b1cfdfc17d076966d94603e973c10c63e8c6c9da6b4dcd7c1"
    end
    on_intel do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.2.0/shlog-darwin-amd64"
      sha256 "afdec3a4d094c61d164d40a2536321608549da96f0fa1b3cab2acc0f56197615"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.2.0/shlog-linux-arm64"
      sha256 "8e5453ddfcc98738c3d92711d90ff9564bb3464bd17fc8ae68cc8d3d1e825571"
    end
    on_intel do
      url "https://github.com/ivalkenburg/shlog/releases/download/v1.2.0/shlog-linux-amd64"
      sha256 "e744b06884d2bef51e230425b5db81b3a081668f9235fe7c7db925cdd70f360c"
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
