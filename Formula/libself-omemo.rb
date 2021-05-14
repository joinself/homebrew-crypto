# Copyright 2020 Self Group Ltd. All Rights Reserved.

require_relative "../lib/custom_download_strategy"

class LibselfOmemo < Formula
  desc "Omemo for selfs implementation of olm"
  homepage "https://joinself.com"
  url "https://github.com/joinself/self-omemo/archive/0.1.2.tar.gz", using: CustomGitHubPrivateRepositoryDownloadStrategy
  sha256 "78326c487dd5afcabe170d09b2e116a3cac43f008836f3b3ea9cfc3657985740"

  bottle do
    root_url "https://dl.bintray.com/selfid/bottles-crypto"
    sha256 cellar: :any, catalina: "985206fb61b6e9006027eba76bc30d120c16099caf0f56ee8ce26f41c32575bb"
  end

  depends_on "rust" => :build
  depends_on "libself-olm"
  depends_on "libsodium"

  def install
    system "cargo", "install"
  end

  test do
    system "true"
  end
end
