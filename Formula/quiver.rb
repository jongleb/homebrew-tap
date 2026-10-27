class Quiver < Formula
  desc "Parallel consistent logical dumper for MySQL and MariaDB"
  homepage "https://github.com/jongleb/quiver"
  license "AGPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.5/quiver-1.3.5-aarch64-apple-darwin.tar.gz"
      sha256 "5f636b3789e720bebcd30c41e784ce6f4715d5c6ce5a700b9251ad3eec6f68d8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.5/quiver-1.3.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f7a8ac6d4bec525fa143712741156a77759346bd05c804a2ef674946c429e74d"
    end

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.5/quiver-1.3.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e540c042c20fd3d476410a812ba55ebe46547f2469bae2bbf1d5377bf07159f7"
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
