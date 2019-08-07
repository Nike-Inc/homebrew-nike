class CerberusCli < Formula
  desc "A CLI for the Cerberus API."
  homepage "http://engineering.nike.com/cerberus"
  url "https://github.com/Nike-Inc/cerberus-cli/releases/download/v0.10.1/cerberus-cli-darwin-amd64"
  sha256 "7f5e4a46b77e43d639f647dd8aa37236c1ba2d017427bfd25a3a8444abee8b1e"
  version "v0.10.1"

  resource "additional_files" do
    url "https://github.com/Nike-Inc/cerberus-cli/archive/v0.10.1.tar.gz"
    sha256 "2aaca3e958b579ab3236fe2dcb2826ef23927f3baed1f9b2ef3d5ad5d5e9fca2"
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
