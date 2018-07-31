class Piggyback < Formula
  desc "Allows you to tunnel SSH over HTTPS with SquidProxy"
  homepage "https://github.com/Nike-Inc/piggyback"
  url "https://github.com/Nike-Inc/piggyback.git", :tag => "v1.1.0"
  revision 1
  
  depends_on "python"

  def install
    libexec.install "piggyback.py"
    bin.install_symlink libexec/"piggyback.py" => "piggyback"
  end

  test do
    system "#{bin}/piggyback.py", "--help"
  end
end
