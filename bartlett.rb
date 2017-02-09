class Bartlett < Formula

  desc "A simple Jenkins command line client to serve your needs."
  homepage "https://github.com/Nike-Inc/bartlett"
  url "https://github.com/Nike-Inc/bartlett/releases/download/1.4.0/bartlett-static-1.4.0.tar.gz"
  sha256 "d5034321dc5c5eef5f799c55e25c43d48a7b8460956e0014cb98db83e37c132a"

  def install
    bin.install "bartlett"
  end

  test do
    system "#{bin}/bartlett", "-h"
  end

end
