# Copyright 2020 Self Group Ltd. All Rights Reserved.

require_relative "../lib/custom_download_strategy"

class LibselfOlm < Formula
  desc "Self fork of olm"
  homepage "https://joinself.com"
  url "https://github.com/joinself/self-olm/archive/0.1.17.tar.gz", using: CustomGitHubPrivateRepositoryDownloadStrategy
  sha256 "90b7bef7dab491cefe3f7a76d52c2ceb4c22df5535641bb3da1aaa0ec74b5b77"

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
