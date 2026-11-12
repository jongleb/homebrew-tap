class Quiver < Formula
  desc "Parallel consistent logical dumper for MySQL and MariaDB"
  homepage "https://github.com/jongleb/quiver"
  license "AGPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.7.0/quiver-1.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "5e8db52af8f6db901dee1bf2dd4906656ce2b3f2b385aa85ff3ef173380c6ca4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jongleb/quiver/releases/download/v1.7.0/quiver-1.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "811126e7c0e0d08bb93e683b1b671837e8cd9c3cffed515c5ce144ca5a567c97"
    end

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.7.0/quiver-1.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "85dc373aeda7142e8e9288e88a32e833c89c5cac1a0c81abdff035091b679a98"
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
