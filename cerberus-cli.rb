class CerberusCli < Formula
  desc "A CLI for the Cerberus API."
  homepage "http://engineering.nike.com/cerberus"
  url "https://github.com/Nike-Inc/cerberus-cli/releases/download/v0.10.4/cerberus-cli-darwin-amd64"
  sha256 "e69ef0e5379d029f24f25b063e8d60f60b10081ba845b6b1202b722679d5b33c"
  version "v0.10.4"

  resource "additional_files" do
    url "https://github.com/Nike-Inc/cerberus-cli/archive/v0.10.4.tar.gz"
    sha256 "3e3e0a100d73710f4ef2a29b656f39701234a0fc88b70cbfc06bfc574b663dfc"
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
