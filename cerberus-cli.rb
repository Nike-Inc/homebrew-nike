class CerberusCli < Formula
  desc "A CLI for the Cerberus API."
  homepage "http://engineering.nike.com/cerberus"
  url "https://github.com/Nike-Inc/cerberus-cli/releases/download/v1.0.4/cerberus-cli-darwin-amd64"
  sha256 "478c2bac333f79e41a48c25d4c2e1a14fd5bd06fcbb2ddcc064f6cf43e7e7e1d"
  version "v1.0.4"

  resource "additional_files" do
    url "https://github.com/Nike-Inc/cerberus-cli/archive/refs/tags/v1.0.4.tar.gz"
    sha256 "280a4ff9b1f5857633a939c4109489740b641ae193110c435a834762052a7a72"
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
