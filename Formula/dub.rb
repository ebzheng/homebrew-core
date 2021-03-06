class Dub < Formula
  desc "Build tool for D projects"
  homepage "https://code.dlang.org/getting_started"
  url "https://github.com/dlang/dub/archive/v1.7.0.tar.gz"
  sha256 "5c4875cf4ced113d35f1da949524a2b366dff93049dffe98da95171bed6cd069"
  version_scheme 1

  head "https://github.com/dlang/dub.git"

  devel do
    url "https://github.com/dlang/dub/archive/v1.6.0-beta.2.tar.gz"
    sha256 "da1877c7c39a4905bca78083784733bfae59d60c7b665169d87fe2d81651b38f"
  end

  bottle do
    sha256 "8a6e8ed83b23822520cd4859bb06f40a28f1a2f54b273a30cb98dc5219eee5c0" => :high_sierra
    sha256 "185b3d1cefd8ba0e3b6f962d34aa40052a9c53c5dc8281a2593be43a1ad7b0e9" => :sierra
    sha256 "6cba8190f08671374747acb22fb01cfefc0cfbd4185acfd8281f12e4cc242519" => :el_capitan
    sha256 "eb1768880ad1844ed50caabcb47d4a528cdffd8a92b7035c74b56c6a4ac361e9" => :x86_64_linux
  end

  depends_on "pkg-config" => [:recommended, :run]
  depends_on "dmd" => :build
  depends_on "curl" unless OS.mac?

  def install
    ENV["GITVER"] = version.to_s
    system "./build.sh"
    bin.install "bin/dub"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dub --version").split(/[ ,]/)[2]
  end
end
