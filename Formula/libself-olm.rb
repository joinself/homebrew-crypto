# Copyright 2020 Self Group Ltd. All Rights Reserved.

require_relative "../lib/custom_download_strategy"

class LibselfOlm < Formula
  desc "Self fork of olm"
  homepage "https://joinself.com"
  url "https://github.com/joinself/self-olm/archive/0.1.28.tar.gz", using: CustomGitHubPrivateRepositoryDownloadStrategy
  sha256 "b7f974ee400697a548bde9001cd0ae56d8982224863bcd35eb4bb70bbd7d5b29"

  bottle do
    root_url "https://github.com/joinself/homebrew-crypto/releases/download/libself-olm-0.1.28"
    sha256 cellar: :any, catalina: "920b6f985749c2f2faca7c3ef0446f7c50c0c727ae5a7e08e34911ee41e9b864"
  end

  depends_on "cmake" => :build
  depends_on "libsodium"

  def install
    system "cmake", ".", "-Bbuild", "-DCMAKE_INSTALL_PREFIX=#{prefix}", *std_cmake_args
    system "cmake", "--build", "build", "--target", "install"
  end

  test do
    system "true"
  end
end
