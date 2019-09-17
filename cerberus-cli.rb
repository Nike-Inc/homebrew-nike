class CerberusCli < Formula
  desc "A CLI for the Cerberus API."
  homepage "http://engineering.nike.com/cerberus"
  url "https://github.com/Nike-Inc/cerberus-cli/releases/download/v0.11.0/cerberus-cli-darwin-amd64"
  sha256 "2e5ed600092a5ecdb308c6720d233758ddfeaf89696d60060fa1bd1523ced4c4"
  version "v0.11.0"

  resource "additional_files" do
    url "https://github.com/Nike-Inc/cerberus-cli/archive/v0.11.0.tar.gz"
    sha256 "0badc92daef320649d8725bc6017a40dd001ac10c66b5d61746f46592c0a44ff"
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
