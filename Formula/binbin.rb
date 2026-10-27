class Binbin < Formula
  desc "Binbin file-sharing client"
  homepage "https://github.com/ivalkenburg/binbin"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/ivalkenburg/binbin/releases/download/v0.2.0/binbin-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "2d3801e4db2e2555f63f56af6966759e9e2f67076fbc428b10c0ba1489f3882e"
    end
    on_intel do
      url "https://github.com/ivalkenburg/binbin/releases/download/v0.2.0/binbin-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "1ac7f050a7ab958baba85852ad7e6386f70d28319efc2bf93c386ffd95982030"
    end
  end

  on_linux do
    depends_on "dbus"
    on_arm do
      url "https://github.com/ivalkenburg/binbin/releases/download/v0.2.0/binbin-0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ec91c5858458a8e52dec6fa100de99bcab343028d2424aa5469514bc2f865cbf"
    end
    on_intel do
      url "https://github.com/ivalkenburg/binbin/releases/download/v0.2.0/binbin-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ddfe7e5929c706e036109beba5bc514f1ea41c8bc3cb37030c724b5399e760a2"
    end
  end

  def install
    bin.install "binbin"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/binbin --version")
  end
end
