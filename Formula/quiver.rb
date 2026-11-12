class Quiver < Formula
  desc "Parallel consistent logical dumper for MySQL and MariaDB"
  homepage "https://github.com/jongleb/quiver"
  license "AGPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.7.1/quiver-1.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "ce82953a843e41e86763dfd822d471559d012504f488eb2615bce1becc254727"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jongleb/quiver/releases/download/v1.7.1/quiver-1.7.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2443c5da4667e5796c6c456eb8993a3275f272173e40a6be428cd75634b07d8e"
    end

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.7.1/quiver-1.7.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3592ff8909a157d5a853b12a93f6505db91bd1553823d8cc435b4b14cafdd271"
    end
  end

  def install
    bin.install "quiver"
    doc.install "README.md"
    (share/"licenses"/name).install "LICENSE", Dir["licenses/*"]
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/quiver --version").strip
  end
end
