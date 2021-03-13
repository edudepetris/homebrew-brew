class Devnotes < Formula
  desc "Everything you need to get started with Devnotes"
  homepage "https://github.com/edudepetris/notes-cli"
  url "https://devnotes-cli.s3.us-east-2.amazonaws.com/devnotes-v0.0.7/devnotes-v0.0.7-darwin-x64.tar.gz"
  sha256 "f2f648e58a9fb9565f0270c8f16275e8757435a7b005bbbfc67054563a74bd1a"

  def install
    inreplace "bin/devnotes", /^CLIENT_HOME=/, "export DEVNOTES_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/devnotes"
  end

  test do
    system bin/"devnotes", "version"
  end
end
