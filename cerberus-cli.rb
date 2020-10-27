class CerberusCli < Formula
  desc "A CLI for the Cerberus API."
  homepage "http://engineering.nike.com/cerberus"
  url "https://github.com/Nike-Inc/cerberus-cli/releases/download/v1.0.0/cerberus-cli-darwin-amd64"
  sha256 "a3b3e263c4ebbfec9ea1e8ad4bbe914fd7b1cee8541fb5740d63c466d45220c6"
  version "v1.0.0"

  resource "additional_files" do
    url "https://github.com/Nike-Inc/cerberus-cli/archive/v1.0.0.tar.gz"
    sha256 "902a4e7c62168586da736f0f52906c723cc15565f7adb995b6de7149f7c0f716"
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
