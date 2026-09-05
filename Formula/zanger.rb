class Zanger < Formula
  desc "A three pane TUI file navigator"
  homepage "https://github.com/hspak/zanger"
  version "0.5.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/hspak/zanger/releases/download/0.5.0/zanger-0.5.0-aarch64-macos.tar.gz"
    sha256 "4ab7895a8fe3a270426eefc5be7be9563b82c96dcabdd47c5d206dad10a3ccdd"

    depends_on arch: :arm64
  end

  on_linux do
    url "https://github.com/hspak/zanger/releases/download/0.5.0/zanger-0.5.0-x86_64-linux-musl.tar.gz"
    sha256 "de2bf229bec5e9b510c36334f623118e4bd10fb9df06ab34411f7bf361464797"

    depends_on arch: :x86_64
  end

  def install
    bin.install "zanger"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zanger --version")
  end
end
