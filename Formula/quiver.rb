class Quiver < Formula
  desc "Parallel consistent logical dumper for MySQL and MariaDB"
  homepage "https://github.com/jongleb/quiver"
  license "AGPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.2.2/quiver-1.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "7e8b02ef683fb76be4d8f806c5b2df3874687c2bf76da970c6560e8297566385"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jongleb/quiver/releases/download/v1.2.2/quiver-1.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e906dddc0bc0b00f6d6ed738ad1d2df145ab9f5f731e7c667faeef47c4f9e233"
    end

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.2.2/quiver-1.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3250c2aa7081699fae5eee451c8920d999424e6d6231af54467ea7892f8847f0"
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
