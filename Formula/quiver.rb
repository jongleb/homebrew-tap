class Quiver < Formula
  desc "Parallel consistent logical dumper for MySQL and MariaDB"
  homepage "https://github.com/jongleb/quiver"
  license "AGPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.9/quiver-1.3.9-aarch64-apple-darwin.tar.gz"
      sha256 "f603620065f5f939d665dd96f21871578ac09cde96b3afef9ea35b1d49103a63"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.9/quiver-1.3.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c704a4aac1b8a82dff809b82cc7f4c98bb7d51a4d3faf8093e51f0391a3730bf"
    end

    on_arm do
      url "https://github.com/jongleb/quiver/releases/download/v1.3.9/quiver-1.3.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "83207e9d1cdc54c45b02fd0538dedbed26c9faa93c8bc065aa906a781581e64a"
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
