# Copyright 2020 Self Group Ltd. All Rights Reserved.

require_relative "../lib/custom_download_strategy.rb"

class LibselfOlm < Formula
  desc "Self fork of olm"
  homepage "https://selfid.net"
  url "https://github.com/aldgate-ventures/self-olm/archive/0.1.17.tar.gz", :using => CustomGitHubPrivateRepositoryDownloadStrategy
  sha256 "90b7bef7dab491cefe3f7a76d52c2ceb4c22df5535641bb3da1aaa0ec74b5b77"

  bottle do
    root_url "https://dl.bintray.com/selfid/bottles-crypto"
    cellar :any
    sha256 "3d5c926cb7eccc312c9d6c93ebad275b08c396c4f4fc1c9da84378d86b3f5cc1" => :catalina
  end

  depends_on "cmake" => :build
  depends_on "libsodium"

  def install
    system "cmake", ".", "-Bbuild", "-DCMAKE_INSTALL_PREFIX=#{prefix}"
    system "cmake", "--build", "build", "--target", "install"
  end

  test do
    system "true"
  end
end
