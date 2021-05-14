# Copyright 2020 Self Group Ltd. All Rights Reserved.

require_relative "../lib/custom_download_strategy"

class LibselfOlm < Formula
  desc "Self fork of olm"
  homepage "https://joinself.com"
  url "https://github.com/joinself/self-olm/archive/0.1.27.tar.gz", using: CustomGitHubPrivateRepositoryDownloadStrategy
  sha256 "d5ee1c5578776382a489902fceb735a2a5548dbe4b2a02ec243fc8d5ba5046cd"

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
