# Copyright 2020 Self Group Ltd. All Rights Reserved.

require_relative "../lib/custom_download_strategy"

class LibselfOmemo < Formula
  desc "Omemo for selfs implementation of olm"
  homepage "https://joinself.com"
  url "https://github.com/joinself/self-omemo/archive/0.1.2.tar.gz"
  sha256 "78326c487dd5afcabe170d09b2e116a3cac43f008836f3b3ea9cfc3657985740"

  bottle do
    root_url "https://github.com/joinself/homebrew-crypto/releases/download/libself-omemo-0.1.2"
    rebuild 2
    sha256 cellar: :any, catalina: "423c16fcf3b833af1f84880b260a37168260919f29d6f173ead6ce387230b1bc"
  end

  depends_on "libself-olm"
  depends_on "libsodium"
  depends_on "llvm" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    lib.install "target/release/libself_omemo.dylib"
    include.install "self_omemo.h"
  end

  test do
    system "true"
  end
end
