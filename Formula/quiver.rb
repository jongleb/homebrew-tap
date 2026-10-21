class Quiver < Formula
  desc "Parallel consistent logical dumper for MySQL and MariaDB"
  homepage "https://github.com/jongleb/quiver"
  license "AGPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.2.1/quiver-1.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "2b37ad30232d7f88df2d1027fb519972fb487f5d223e861e9416f5d4fa7595e2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jongleb/quiver/releases/download/v1.2.1/quiver-1.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b7b9932ffec17bdecf80d7e98c1468a21269a9b6f4d401f14624fb8ed0205e50"
    end

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.2.1/quiver-1.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8a42a71432136989a9111fd42734ed2115405e1521a14e6f95048f48b63f9b68"
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
