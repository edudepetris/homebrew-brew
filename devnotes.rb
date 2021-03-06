class Devnotes < Formula
  desc "Everything you need to get started with Devnotes"
  homepage "https://github.com/edudepetris/notes-cli"
  url "https://devnotes-cli.s3.us-east-2.amazonaws.com/devnotes-v0.0.7/devnotes-v0.0.7-darwin-x64.tar.gz"
  sha256 "39507c1f6f29f8205f6b3f684d9a35a144954f89ae66f5c84ee4788235671cf4"

  def install
    inreplace "bin/devnotes", /^CLIENT_HOME=/, "export DEVNOTES_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/devnotes"
  end

  test do
    system bin/"devnotes", "version"
  end
end
