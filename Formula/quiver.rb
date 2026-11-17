class Quiver < Formula
  desc "Parallel consistent logical dumper for MySQL and MariaDB"
  homepage "https://github.com/jongleb/quiver"
  license "AGPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.8.0/quiver-1.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "faf1170525f43f5cbe87d229c9427a3b87fda84458e1ea99238f23ed48959cf0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jongleb/quiver/releases/download/v1.8.0/quiver-1.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "400a4111ffdabd135843171137e27159a522f403ae7eda8b98c005d282e3011c"
    end

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.8.0/quiver-1.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3322452035477a240589e1278b330dee4ab8e7f61a165c6c29f0a48305a91999"
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
