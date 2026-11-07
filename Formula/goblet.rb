class Goblet < Formula
  desc "Static file server for local development"
  homepage "https://github.com/ivalkenburg/goblet"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ivalkenburg/goblet/releases/download/v1.0.3/goblet-darwin-arm64"
      sha256 "889214bcca0b08f5fb100e17b6737a4dddce1c21830cc7abb1a6c26e071229a3"
    end
    on_intel do
      url "https://github.com/ivalkenburg/goblet/releases/download/v1.0.3/goblet-darwin-amd64"
      sha256 "6b3d4f2da6c0f62056b9b3f933d24ab70a0c477cc22dc2b1e6b5cf68118ca78a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ivalkenburg/goblet/releases/download/v1.0.3/goblet-linux-arm64"
      sha256 "9aa5a6fc8fc5a5657cf7fbb8455a5b68ba32e33b0da9936946746131f47ec17c"
    end
    on_intel do
      url "https://github.com/ivalkenburg/goblet/releases/download/v1.0.3/goblet-linux-amd64"
      sha256 "79d5b385eeca85872d5b00266a7fdf644d0aad573b862670ccbd1801020e17c1"
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
