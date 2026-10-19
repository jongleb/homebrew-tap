class Quiver < Formula
  desc "Parallel consistent logical dumper for MySQL and MariaDB"
  homepage "https://github.com/jongleb/quiver"
  license "AGPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.1.0/quiver-1.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "d5f340ea8e2c8b46138c83931a7180f61310f449aea8568602a7050e892d30b6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jongleb/quiver/releases/download/v1.1.0/quiver-1.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c86aaee65d470582cdfdefd883c18c4761d9dea559e6c20605eb3cb5f4a02f41"
    end

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.1.0/quiver-1.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "16f7317b8848a680332fb1b7e00d595a9df1107d752c846c9dede5455a4a3d33"
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
