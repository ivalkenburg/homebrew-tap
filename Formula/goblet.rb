class Goblet < Formula
  desc "Static file server for local development"
  homepage "https://github.com/ivalkenburg/goblet"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ivalkenburg/goblet/releases/download/v1.0.2/goblet-darwin-arm64"
      sha256 "49d8b3d16ec1e9c6805711c4e6f8e4681f066a0181695dcf75db763152cd1bd0"
    end
    on_intel do
      url "https://github.com/ivalkenburg/goblet/releases/download/v1.0.2/goblet-darwin-amd64"
      sha256 "08590a6dde7afcd14097372e5b5a19ae2f44fa1a7089bf68863589f1d7332b9d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ivalkenburg/goblet/releases/download/v1.0.2/goblet-linux-arm64"
      sha256 "a3a8e4cd11fd5c51924af4e00efdcaddc892c78b3fb2e60500e9763b2b60921d"
    end
    on_intel do
      url "https://github.com/ivalkenburg/goblet/releases/download/v1.0.2/goblet-linux-amd64"
      sha256 "9daa4c2dbc13c4ff1e23ef3e8114c4b404d32eefa565ab09267799c7d528100d"
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
