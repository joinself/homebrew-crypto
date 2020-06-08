require_relative "../custom_download_strategy.rb"

class LibselfOlm < Formula
  desc "Self fork of olm"
  homepage "https://selfid.net"
  url "https://github.com/aldgate-ventures/self-olm/archive/0.1.16.tar.gz", :using => CustomGitHubPrivateRepositoryDownloadStrategy
  sha256 "49d08d07ef33ef89c4baf5abd40e386614c5dca9f3b1c44d8af3528381dbbf31"

  depends_on "libsodium"
  depends_on "cmake" => :build

  def install
    system "cmake", ".", "-Bbuild", "-DCMAKE_INSTALL_PREFIX=#{prefix}"
    system "cmake", "--build", "build", "--target", "install"
  end

  test do
    system "false"
  end
end
