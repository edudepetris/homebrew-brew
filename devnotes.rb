class Devnotes < Formula
  desc "Everything you need to get started with Devnotes"
  homepage "https://github.com/edudepetris/notes-cli"
  url "https://devnotes-cli.s3.us-east-2.amazonaws.com/devnotes-v0.0.8/devnotes-v0.0.8-darwin-x64.tar.gz"
  sha256 "9c10ef5cdc8610c638b1e3f5f6eeec5ba269b0c977a8768ad14555b90ead17d4"

  def install
    inreplace "bin/devnotes", /^CLIENT_HOME=/, "export DEVNOTES_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/devnotes"
  end

  test do
    system bin/"devnotes", "version"
  end
end
