class CerberusCli < Formula
  desc "A CLI for the Cerberus API."
  homepage "http://engineering.nike.com/cerberus"
  url "https://github.com/Nike-Inc/cerberus-cli/releases/download/v1.0.1/cerberus-cli-darwin-amd64"
  sha256 "9c01378aa2bbbda4a412bb0fdb17459d6e9542ffc6f43c63a1271c9f1c70d8f2"
  version "v1.0.1"

  resource "additional_files" do
    url "https://github.com/Nike-Inc/cerberus-cli/archive/v1.0.1.tar.gz"
    sha256 "cb512b741413d5a12ff9394e66f6750100be55492eb3e4c86765c50a9379128d"
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
