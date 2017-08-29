class Bartlett < Formula

  desc "A simple Jenkins command line client to serve your needs."
  homepage "https://github.com/Nike-Inc/bartlett"
  url "https://github.com/Nike-Inc/bartlett/releases/download/1.6.0/bartlett-static-1.6.0.tar.gz"
  sha256 "d6b2260d774a3b84654b22cacf772bdaeeed1125724e4c818edaffa27957b1cb"

  def install
    bin.install "bartlett"
  end

  test do
    system "#{bin}/bartlett", "-h"
  end

end
