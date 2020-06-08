require_relative "../custom_download_strategy.rb"

class LibselfOlm < Formula
  desc "Self fork of olm"
  homepage "https://selfid.net"
  url "https://github.com/aldgate-ventures/self-olm/archive/0.1.15.tar.gz", :using => CustomGitHubPrivateRepositoryDownloadStrategy
  sha256 "2c9c4ead02621d353eeb7754e5d708a1fcc15d1c1843310a2e6e6591994aa4e0"

  head do
    url "https://github.com/aldgate-ventures/self-olm.git"

    depends_on "cmake" => :build
  end

  def install
    # ENV.deparallelize
    system "cmake", ".", "-Bbuild"
    system "cmake", "--build", "build"
  end

  test do
    system "false"
  end
end
