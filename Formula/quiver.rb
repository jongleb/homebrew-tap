class Quiver < Formula
  desc "Parallel consistent logical dumper for MySQL and MariaDB"
  homepage "https://github.com/jongleb/quiver"
  license "AGPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.0/quiver-1.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "1c3888ef72de2d18d4b449a31eab41ce30b04c31c608170dd26ca2850e1ac2cf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.0/quiver-1.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ddaa5ab81fb2f48a7feb0890008944c37ad5d8977db8805fe0a1d684d960c9bb"
    end

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.0/quiver-1.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0ec75be922c193187a8a709cf45bd173dfdb5f08b9db874c23cb171b39398f72"
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
