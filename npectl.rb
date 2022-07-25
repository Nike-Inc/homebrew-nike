class NPECTL < Formula
  desc "A CLI for the NPE API."
  homepage "https://docs.platforms.nike.com/NPE"
  url "https://github.com/nike-platform-engine/npectl/releases/download/v0.6.0/npectl-osx"
  sha256 "3df93b6b0c19e851c0806182b8a023928b2c989f7e1386489017b331b02baab2"
  version "v0.6.0"

  def install
    bin.install "npectl-osx" => "npectl"
  end

  test do
    system "#{bin}/npectl", "--help"
  end
end
