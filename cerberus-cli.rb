class CerberusCli < Formula
  desc "A CLI for the Cerberus API."
  homepage "http://engineering.nike.com/cerberus"
  url "https://github.com/Nike-Inc/cerberus-cli/releases/download/v0.10.2/cerberus-cli-darwin-amd64"
  sha256 "32a715111f9dda1da5a014dcca6c10fea32199e75b3ad810622556b96ffafc1c"
  version "v0.10.2"

  resource "additional_files" do
    url "https://github.com/Nike-Inc/cerberus-cli/archive/v0.10.2.tar.gz"
    sha256 "6dd9ded54087d787eacf82977944ffb2f13d7d250526d9ab8e0f976054336f85"
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
