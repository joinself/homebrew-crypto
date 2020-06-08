require_relative "../custom_download_strategy.rb"

class LibselfOlm < Formula
  desc "Self fork of olm"
  homepage "https://selfid.net"
  url "https://github.com/aldgate-ventures/self-olm/archive/0.1.15.tar.gz", :using => CustomGitHubPrivateRepositoryDownloadStrategy
  sha256 "2c9c4ead02621d353eeb7754e5d708a1fcc15d1c1843310a2e6e6591994aa4e0"

  depends_on "cmake" => :build
  depends_on "libsodium" => :build

  def install
    system "cmake", ".", "-Bbuild", "-DCMAKE_INSTALL_PREFIX=#{prefix}"
    system "cmake", "--build", "build", "--target", "install"
  end

  test do
    system "false"
  end
end
