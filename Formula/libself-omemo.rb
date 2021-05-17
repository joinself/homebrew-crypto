# Copyright 2020 Self Group Ltd. All Rights Reserved.

require_relative "../lib/custom_download_strategy"

class LibselfOmemo < Formula
  desc "Omemo for selfs implementation of olm"
  homepage "https://joinself.com"
  url "https://github.com/joinself/self-omemo/archive/0.1.2.tar.gz" # , using: CustomGitHubPrivateRepositoryDownloadStrategy
  sha256 "78326c487dd5afcabe170d09b2e116a3cac43f008836f3b3ea9cfc3657985740"

  bottle do
    root_url "https://github.com/joinself/homebrew-crypto/releases/download/libself-omemo-0.1.2"
    rebuild 1
    sha256 cellar: :any, catalina: "61cbb122b388acf2ab58e772c2f38b814ae4199e5b5af5bdfb6d2c64f6555bd5"
  end

  depends_on "rust" => :build
  depends_on "libself-olm"
  depends_on "libsodium"

  # rubocop:disable FormulaAudit

  def install
    system "cargo", "build", "--release"
    lib.install "target/release/libself_omemo.dylib"
    include.install "self_omemo.h"
  end

  # rubocop:enable FormulaAudit

  test do
    system "true"
  end
end
