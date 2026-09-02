class Flamez < Formula
  desc "Live process-lifetime and CPU-activity flamegraph"
  homepage "https://github.com/hspak/flamez"
  version "0.0.0"
  url "https://github.com/hspak/flamez/releases/download/0.0.0/flamez-0.0.0-aarch64-macos.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  disable! date: "2026-09-01", because: "the first Homebrew release has not been published"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  def install
    prefix.install "bin", "share"
  end

  test do
    assert_equal "flamez #{version}\n", shell_output("#{bin}/flamez --version")
  end
end
