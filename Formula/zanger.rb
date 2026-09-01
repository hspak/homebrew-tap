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
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"

    depends_on arch: :arm64
  end

  on_linux do
    url "https://github.com/hspak/zanger/releases/download/0.4.0/zanger-0.4.0-x86_64-linux-musl.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"

    depends_on arch: :x86_64
  end

  def install
    bin.install "zanger"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zanger --version")
  end
end
