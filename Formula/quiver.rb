class Quiver < Formula
  desc "Parallel consistent logical dumper for MySQL and MariaDB"
  homepage "https://github.com/jongleb/quiver"
  license "AGPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.2/quiver-1.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "9b75ef5e794aaff2b54864f633ed01b2f5af30d2d481a9636845fc15c43dd1aa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.2/quiver-1.3.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "44126ea731ea31f08d87788f3036aadd81b0d3bf2459f563638395379990a7a5"
    end

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.2/quiver-1.3.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6674ed2f29121fad2437bf0cd97b226d75b79342c7609cc37e0285961e62cbaf"
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
