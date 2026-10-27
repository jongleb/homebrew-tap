class Quiver < Formula
  desc "Parallel consistent logical dumper for MySQL and MariaDB"
  homepage "https://github.com/jongleb/quiver"
  license "AGPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.8/quiver-1.3.8-aarch64-apple-darwin.tar.gz"
      sha256 "271610c35b25c7e4a05b5890d859636905602bbc8e9163f3e221ece8f40f0d54"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.8/quiver-1.3.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af716f300d84a8a94345eac43d5e35d3c34dd9fc36fe46271051aa13bcbc3c7a"
    end

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.8/quiver-1.3.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8b6c8d9a7aae14619dc3e17eeb3979b3081ef8acc03928f1b6ac77f0761217a3"
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
