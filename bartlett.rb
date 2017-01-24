class Bartlett < Formula

  desc "A simple Jenkins command line client to serve your needs."
  homepage "https://github.com/Nike-Inc/bartlett"
  url "https://github.com/Nike-Inc/bartlett/releases/download/1.3.0/bartlett-static-1.3.0.tar.gz"
  sha256 "9e50fbad8d58770472b29e917979179fdf5dd9afb07ae1d6cc8a9622348903cf"

  def install
    bin.install "bartlett"
  end

  test do
    system "#{bin}/bartlett", "-h"
  end

end
