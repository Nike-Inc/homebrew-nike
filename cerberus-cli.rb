class CerberusCli < Formula
  desc "A CLI for the Cerberus API."
  homepage "http://engineering.nike.com/cerberus"
  url "https://github.com/Nike-Inc/cerberus-cli/releases/download/v1.1.0/cerberus-cli-darwin-amd64"
  sha256 "cb1a76b842105d2ebcf9d534f3e89c7d407e6bab70a6f1fc888c03e06a6ad7de"
  version "v1.1.0"

  resource "additional_files" do
    url "https://github.com/Nike-Inc/cerberus-cli/archive/refs/tags/v1.1.0.tar.gz"
    sha256 "dbfc1e6a2d23e34dcd401144e1deb66f4464793a36f6f5b77d657247d37cc8c5"
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
