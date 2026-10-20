class Quiver < Formula
  desc "Parallel consistent logical dumper for MySQL and MariaDB"
  homepage "https://github.com/jongleb/quiver"
  license "AGPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.2.0/quiver-1.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "3ebf664bab83183e670d629d4e6463156a92d1fe2447796d54551cd2bca8d9cc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jongleb/quiver/releases/download/v1.2.0/quiver-1.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "32216c3460687fee74d11ad5ee35ea43705b819707680bb29ce3402aa7272b88"
    end

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.2.0/quiver-1.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5916512768f9071263e0045d29c95837bfe92d355720ee068f9cc8784e1c547d"
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
