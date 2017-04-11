class Bartlett < Formula

  desc "A simple Jenkins command line client to serve your needs."
  homepage "https://github.com/Nike-Inc/bartlett"
  url "https://github.com/Nike-Inc/bartlett/releases/download/1.5.1/bartlett-static-1.5.1.tar.gz"
  sha256 "3d46b4813914df07071bf2314d8e8df09a5c849c80827f33a16174de6cad1d50"

  def install
    bin.install "bartlett"
  end

  test do
    system "#{bin}/bartlett", "-h"
  end

end
