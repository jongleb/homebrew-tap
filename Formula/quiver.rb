class Quiver < Formula
  desc "Parallel consistent logical dumper for MySQL and MariaDB"
  homepage "https://github.com/jongleb/quiver"
  license "AGPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.6.1/quiver-1.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "c806e521d405687aa15642bfb2a06166028a09e50d29bd7888c30b8862a042a9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jongleb/quiver/releases/download/v1.6.1/quiver-1.6.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b0099038e197c03709e522897403c08bb8401b959f18c1c3c56273b55747330e"
    end

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.6.1/quiver-1.6.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b92d1f66abb1ceb546c021b8157246410b761d70c62c80f2d42835e4db327777"
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
