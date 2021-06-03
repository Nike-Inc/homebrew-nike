class CerberusCli < Formula
  desc "A CLI for the Cerberus API."
  homepage "http://engineering.nike.com/cerberus"
  url "https://github.com/Nike-Inc/cerberus-cli/releases/download/v1.0.2/cerberus-cli-darwin-amd64"
  sha256 "bcb5f9b52aa2e75b09bd5ad3387ce9b0f7996572b40a21cb633f10760e89c419"
  version "v1.0.2"

  resource "additional_files" do
    url "https://github.com/Nike-Inc/cerberus-cli/archive/v1.0.2.tar.gz"
    sha256 "d3e1efbc63f4622bb21693137bf6f3873a33b33289c1574217f929c4eb1af412"
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
