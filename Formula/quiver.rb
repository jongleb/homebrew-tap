class Quiver < Formula
  desc "Parallel consistent logical dumper for MySQL and MariaDB"
  homepage "https://github.com/jongleb/quiver"
  license "AGPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.0.0/quiver-1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "e23505b04981bd29eec49f73caefb03f9c9a92fc4fcb4ead86e4939fa9a296db"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jongleb/quiver/releases/download/v1.0.0/quiver-1.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4e6c1c7af58512c8cd04055a208569440f04f49aa3fc13ee41d487425b6b796f"
    end

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.0.0/quiver-1.0.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b6e4cce89849d46f8300f2591b04c003318eb6fa39d38718189031aa5c8f62aa"
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
