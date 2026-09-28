class Goblet < Formula
  desc "Static file server for local development"
  homepage "https://github.com/ivalkenburg/goblet"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ivalkenburg/goblet/releases/download/v1.0.1/goblet-darwin-arm64"
      sha256 "9fd2da6d81e4684f82906aba1b2651b5377e4680c74832ad5f254ec74e665b0f"
    end
    on_intel do
      url "https://github.com/ivalkenburg/goblet/releases/download/v1.0.1/goblet-darwin-amd64"
      sha256 "9c7bd3b4ac40d1d600ec463284c621aeb30566e3e941a06496450c0031830679"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ivalkenburg/goblet/releases/download/v1.0.1/goblet-linux-arm64"
      sha256 "994d774dfc560894c09482acce8eff6c7b9bf439a53df6cc6d8ef8d590b27bf1"
    end
    on_intel do
      url "https://github.com/ivalkenburg/goblet/releases/download/v1.0.1/goblet-linux-amd64"
      sha256 "52ee0830303626ec908ef450e6bc33ca394798efae4e2e37fa9a0b5b04f55664"
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
