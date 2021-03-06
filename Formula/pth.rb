class Pth < Formula
  desc "GNU Portable THreads"
  homepage "https://www.gnu.org/software/pth/"
  url "https://ftp.gnu.org/gnu/pth/pth-2.0.7.tar.gz"
  mirror "https://ftpmirror.gnu.org/pth/pth-2.0.7.tar.gz"
  sha256 "72353660c5a2caafd601b20e12e75d865fd88f6cf1a088b306a3963f0bc77232"

  bottle do
    cellar :any
    rebuild 2
    sha256 "e7ed86c562756b07fcf9bb148c76f17c6cb4f3b02bf84ffe82285e3b279e7836" => :mojave
    sha256 "da4549f9e89a71478b47f4454f9a259dc3a56a109f24083ce8f4ea69b11ac9c5" => :high_sierra
    sha256 "583d6ae1681974c7461650151253c5a302f33fb16dae74b5546a4a693cec71d1" => :sierra
    sha256 "bac7f73c061797768be28e21bec2e7773cfd70ff7c3f46eafd464b9632d5eae4" => :el_capitan
    sha256 "7b31c6d65a97c722e661feb4c73a59a9025f1eac6b297ff181931bbdbc894ff3" => :yosemite
    sha256 "4271f5c483e95641caa088059669dad1ab6d95774ff66eecae2af1c5c0ddaf0a" => :mavericks
    sha256 "b478e70f3b391d547d98334070185e44d9d9074943bafbb3a7bf2e13dfdc34b9" => :mountain_lion
  end

  def install
    ENV.deparallelize

    # Note: shared library will not be build with --disable-debug, so don't add that flag
    system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
    system "make"
    system "make", "test"
    system "make", "install"
  end

  test do
    system "#{bin}/pth-config", "--all"
  end
end
