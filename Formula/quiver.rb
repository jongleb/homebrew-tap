class Quiver < Formula
  desc "Parallel consistent logical dumper for MySQL and MariaDB"
  homepage "https://github.com/jongleb/quiver"
  license "AGPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.6.0/quiver-1.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "2b2efdfd4430f72f24238b78ee584673f8698e27f1f5543262f2176de830ea5f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jongleb/quiver/releases/download/v1.6.0/quiver-1.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "32d7f8bd7ed99cdaf1765682c18e26d58af3390b070737c24a31845efe2efa0f"
    end

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.6.0/quiver-1.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "98f66cdbd0f96ffaa9adce1a45cdf4ba3f9d489687dc3e49c0d132d2b372b05b"
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
