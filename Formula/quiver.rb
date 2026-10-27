class Quiver < Formula
  desc "Parallel consistent logical dumper for MySQL and MariaDB"
  homepage "https://github.com/jongleb/quiver"
  license "AGPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.7/quiver-1.3.7-aarch64-apple-darwin.tar.gz"
      sha256 "4ad4fd601a4b8b758e1d4db19e539e108a3a69b1968aa7b49f0382bdb9a10cb2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.7/quiver-1.3.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "763184895315e2b1eb2312db90ca3408ebfbb041d13749f9ed07b25160efcd5f"
    end

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.7/quiver-1.3.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d344340f17bb5065e27d5648d553e2614257b32f808bb57e20eb970da84d936f"
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
