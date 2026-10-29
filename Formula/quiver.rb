class Quiver < Formula
  desc "Parallel consistent logical dumper for MySQL and MariaDB"
  homepage "https://github.com/jongleb/quiver"
  license "AGPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.5.0/quiver-1.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "4fd04a9324d02f1c08b06b65b00ce7449e748fa6fd6d01cda3d47057a3392cd4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jongleb/quiver/releases/download/v1.5.0/quiver-1.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "61ef370df1f05e3de15bfba1e3d548c02c0478b8227a07b45bcfc77fbcc5b164"
    end

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.5.0/quiver-1.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2b5285e6e5d91d5d94fd658c074a5d543acaf94a922d8d6f319f6356ad8fadf5"
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
