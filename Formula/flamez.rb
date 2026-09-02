class Flamez < Formula
  desc "Live process-lifetime and CPU-activity flamegraph"
  homepage "https://github.com/hspak/flamez"
  version "0.1.1"
  url "https://github.com/hspak/flamez/releases/download/0.1.1/flamez-0.1.1-aarch64-macos.tar.gz"
  sha256 "11de6b0e1d8c89b20877030c07eb14c88c0802530826e2b05ff5e67b43d98e88"
  license "MIT"


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
