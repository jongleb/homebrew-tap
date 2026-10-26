class Quiver < Formula
  desc "Parallel consistent logical dumper for MySQL and MariaDB"
  homepage "https://github.com/jongleb/quiver"
  license "AGPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.4/quiver-1.3.4-aarch64-apple-darwin.tar.gz"
      sha256 "e5984f0a32fbf7cfc4121dd43b542311a6141657de5aca2f9f5ea24ce0b4bb4d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.4/quiver-1.3.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a8db4a5ccd341d681e739293f5275329af98c29b6da678984daf0d84639ac493"
    end

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.4/quiver-1.3.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "87b7fc434d8bf2632c992f826ab11a08523c9a83d6c2516249271d8a28c24c43"
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
