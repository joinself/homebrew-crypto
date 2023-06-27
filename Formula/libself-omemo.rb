# Copyright 2020 Self Group Ltd. All Rights Reserved.

require_relative "../lib/custom_download_strategy"

class LibselfOmemo < Formula
  desc "Omemo for selfs implementation of olm"
  homepage "https://joinself.com"
  url "https://github.com/joinself/self-omemo/archive/0.5.0.tar.gz"
  sha256 "c10f538dcbc265fce1ba760df6755252fd15b45c3613c92388b241309ae08c5f"

  depends_on "llvm" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    lib.install "target/release/libself_omemo.a"
    include.install "self_omemo.h"
  end

  test do
    system "true"
  end
end
