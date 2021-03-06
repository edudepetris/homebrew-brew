class Devnotes < Formula
  desc "Everything you need to get started with Devnotes"
  homepage "https://github.com/edudepetris/notes-cli"
  url "https://devnotes-cli.s3.us-east-2.amazonaws.com/devnotes-v0.0.6/devnotes-v0.0.6-darwin-x64.tar.gz"
  sha256 "da6bd7b3f19a3270c9bba4bb501697eef11539893fa37d340bcdf2bdcaefefd2"

  def install
    inreplace "bin/devnotes", /^CLIENT_HOME=/, "export DEVNOTES_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/devnotes"
  end

  test do
    system bin/"devnotes", "version"
  end
end
