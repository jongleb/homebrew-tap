class Quiver < Formula
  desc "Parallel consistent logical dumper for MySQL and MariaDB"
  homepage "https://github.com/jongleb/quiver"
  license "AGPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.6/quiver-1.3.6-aarch64-apple-darwin.tar.gz"
      sha256 "065a4d27eff3e31a3a9f5f9f242785bb1161b112ad46f4adf6a0f57832b9d334"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.6/quiver-1.3.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "04be7af60e9d30fb58e844388ea9f8d8cc5689cec08bd18002f60dbbb3850202"
    end

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.6/quiver-1.3.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d06e3a0084087931d325fe46ff1d90ab734821f3d44941a2cb692cc52f12f249"
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
