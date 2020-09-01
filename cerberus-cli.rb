class CerberusCli < Formula
  desc "A CLI for the Cerberus API."
  homepage "http://engineering.nike.com/cerberus"
  url "https://github.com/Nike-Inc/cerberus-cli/releases/download/v0.12.0/cerberus-cli-darwin-amd64"
  sha256 "a3b3e263c4ebbfec9ea1e8ad4bbe914fd7b1cee8541fb5740d63c466d45220c6"
  version "v0.12.0"

  resource "additional_files" do
    url "https://github.com/Nike-Inc/cerberus-cli/archive/v0.12.0.tar.gz"
    sha256 "2d51db82115dfa29957171dc678f76cdce4ef8258ea4ca2311fa06b83280bd91"
  end

  option "with-completion"

  def install
    bin.install "cerberus-cli-darwin-amd64" => "cerberus"
    if build.with? "completion"
      lib.mkpath
      resource("additional_files").stage {
        mv "cerberus-completion.sh", "#{lib}/cerberus"
        ln_s "#{lib}/cerberus", "#{etc}/bash_completion.d/cerberus", force: true
      }
    end
  end

  test do
    system "#{bin}/cerberus", "help"
  end
end

