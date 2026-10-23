class Quiver < Formula
  desc "Parallel consistent logical dumper for MySQL and MariaDB"
  homepage "https://github.com/jongleb/quiver"
  license "AGPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.1/quiver-1.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "6d03d68b61b8817bd67a84cc0ec5b2555d8d71ec9ff4f50b3b30e051804a84e2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.1/quiver-1.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "98f33835fc141192320491a3ceeb252503dfe9c4877fb3b7c1b70a35a1988794"
    end

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.1/quiver-1.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "41d01ff7ef6571d43ffc38909e3e0b0d713a4b21f1900062f033a8cac4fc0829"
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
