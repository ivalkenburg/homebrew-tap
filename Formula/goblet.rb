class Goblet < Formula
  desc "Static file server for local development"
  homepage "https://github.com/ivalkenburg/goblet"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ivalkenburg/goblet/releases/download/v1.0.4/goblet-darwin-arm64"
      sha256 "7d44e4236e3696a2febf9d79fa055bf14b4aff3f950e5625a9a0b4ada2699cbc"
    end
    on_intel do
      url "https://github.com/ivalkenburg/goblet/releases/download/v1.0.4/goblet-darwin-amd64"
      sha256 "77231fe36b645866cc1d612524c910661c95f77f756df1ab5cfcb2618fc7406d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ivalkenburg/goblet/releases/download/v1.0.4/goblet-linux-arm64"
      sha256 "2b8d876eef03f30e2a49109c4a456c187755183cdbef7a81c0e6c2f7166c8329"
    end
    on_intel do
      url "https://github.com/ivalkenburg/goblet/releases/download/v1.0.4/goblet-linux-amd64"
      sha256 "3c84e1652a3df6fcb86acd85ad0ab41e350a96010219421f632deed3266aed60"
    end
  end

  def install
    bin.install Dir["goblet-*"].first => "goblet"
    chmod 0755, bin/"goblet"
    generate_completions_from_executable(bin/"goblet", shell_parameter_format: :cobra)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/goblet --version")
  end
end
