class Quiver < Formula
  desc "Parallel consistent logical dumper for MySQL and MariaDB"
  homepage "https://github.com/jongleb/quiver"
  license "AGPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.4.0/quiver-1.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "c396fe005cbef5b0698e796ba43b6287bc8d0a68ff5572bbc841d40c673de564"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jongleb/quiver/releases/download/v1.4.0/quiver-1.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1e7d303e615daead322359ce79ac2bc48a81dcb53a109dc152fd283418a8df77"
    end

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.4.0/quiver-1.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e592e8d98c764f2c89536e6c19dfab5166efa118bbe7be5f9ddb42af8128addf"
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
