require_relative "../custom_download_strategy.rb"

class LibselfOmemo < Formula
  desc "Omemo for selfs implementation of olm"
  homepage "https://selfid.net"
  url "https://github.com/aldgate-ventures/self-omemo/archive/0.1.2.tar.gz", :using => CustomGitHubPrivateRepositoryDownloadStrategy
  sha256 "78326c487dd5afcabe170d09b2e116a3cac43f008836f3b3ea9cfc3657985740"

  depends_on "libsodium"
  depends_on "libself-olm"
  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    system "cp", "self_omemo.h", "#{prefix}/include/self_omemo.h"
    system "cp", "target/release/libself_omemo.dylib", "#{prefix}/lib/libself_omemo.dylib"
  end

  test do
    system "false"
  end
end
