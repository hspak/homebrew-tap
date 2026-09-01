class Zanger < Formula
  desc "A three pane TUI file navigator"
  homepage "https://github.com/hspak/zanger"
  version "0.4.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/hspak/zanger/releases/download/0.4.0/zanger-0.4.0-aarch64-macos.tar.gz"
    sha256 "01f211ab15c1f57c69c44e45741e5f72db573a4e5d399ffd34d5bd41d0e9ec3b"

    depends_on arch: :arm64
  end

  on_linux do
    url "https://github.com/hspak/zanger/releases/download/0.4.0/zanger-0.4.0-x86_64-linux-musl.tar.gz"
    sha256 "d9ddc40faeaacfdbd2b0069d6238c4d557fa28bbbc85d174389f09055d6a0740"

    depends_on arch: :x86_64
  end

  def install
    bin.install "zanger"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zanger --version")
  end
end
