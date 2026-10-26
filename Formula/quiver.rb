class Quiver < Formula
  desc "Parallel consistent logical dumper for MySQL and MariaDB"
  homepage "https://github.com/jongleb/quiver"
  license "AGPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.3/quiver-1.3.3-aarch64-apple-darwin.tar.gz"
      sha256 "04e3e52024d1acd4a029155fba28f4a6fddfbb55a11b70541099c74991d58da8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.3/quiver-1.3.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7135ae354dc857572915a810c4f59d5e2a479f2cf73b476438145b105f826578"
    end

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.3/quiver-1.3.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "07c4797813f41eb2a922c7222914161052b60ec663885005d025b2bdb54e3f9e"
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
