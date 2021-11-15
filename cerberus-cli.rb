class CerberusCli < Formula
  desc "A CLI for the Cerberus API."
  homepage "http://engineering.nike.com/cerberus"
  url "https://github.com/Nike-Inc/cerberus-cli/releases/download/v1.0.3/cerberus-cli-darwin-amd64"
  sha256 "cdabb68f8040a41fa54328f084b529baaa04fc4044c1eac7ffdf24f0a387cd4e"
  version "v1.0.3"

  resource "additional_files" do
    url "https://github.com/Nike-Inc/cerberus-cli/archive/v1.0.3.tar.gz"
    sha256 "9cb0eee878eb0aedb9bc83ffcca8793b3ffdc563e69ecd8840a2fa4db1157a92"
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
