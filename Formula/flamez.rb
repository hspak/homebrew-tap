class Flamez < Formula
  desc "Live process-lifetime and CPU-activity flamegraph"
  homepage "https://github.com/hspak/flamez"
  version "0.2.0"
  url "https://github.com/hspak/flamez/releases/download/0.2.0/flamez-0.2.0-aarch64-macos.tar.gz"
  sha256 "fca49be201c11a27b77836164c53dfdae2b14308efd8cf26c4e06ab565f74586"
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
