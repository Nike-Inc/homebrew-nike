class CerberusCli < Formula
  desc "A CLI for the Cerberus API."
  homepage "http://engineering.nike.com/cerberus"
  url "https://github.com/Nike-Inc/cerberus-cli/releases/download/v0.11.1/cerberus-cli-darwin-amd64"
  sha256 "c81225a56f20cd5520c262d775c0395bdcb073bd4a2b82d1055a1eb19b1269c6"
  version "v0.11.1"

  resource "additional_files" do
    url "https://github.com/Nike-Inc/cerberus-cli/archive/v0.11.1.tar.gz"
    sha256 "5f64b17c98afd850b1309eec130923983030b235bdbfc906693bd6a586c18a7d"
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

