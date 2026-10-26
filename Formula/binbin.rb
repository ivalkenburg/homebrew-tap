class Binbin < Formula
  desc "Binbin file-sharing client"
  homepage "https://github.com/ivalkenburg/binbin"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/ivalkenburg/binbin/releases/download/v0.1.0/binbin-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "7248fb15a206116ac0eced52d8b927f9ab506da2415d21af7c894d5762cd80a5"
    end
    on_intel do
      url "https://github.com/ivalkenburg/binbin/releases/download/v0.1.0/binbin-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "476cd7ee76153f9003f9c08a7f61d03623b3361f923cd789019d9a374cfd995c"
    end
  end

  on_linux do
    depends_on "dbus"
    on_arm do
      url "https://github.com/ivalkenburg/binbin/releases/download/v0.1.0/binbin-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a121bfa18236eb64be95c6b54a0492940886382ecf3449a02e5d044c34070fe6"
    end
    on_intel do
      url "https://github.com/ivalkenburg/binbin/releases/download/v0.1.0/binbin-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0ea9b49d768c2c33c556bbe66b1b2466765bd9638e17d904694460f2d4631a80"
    end
  end

  def install
    bin.install "binbin"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/binbin --version")
  end
end
