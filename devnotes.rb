class Devnotes < Formula
  desc "Everything you need to get started with Devnotes"
  homepage "https://github.com/edudepetris/notes-cli"
  url "https://devnotes-cli.s3.us-east-2.amazonaws.com/devnotes-v0.0.5/devnotes-v0.0.5-darwin-x64.tar.gz"
  sha256 "fe2dd4167b451d62f84a6badcba9541b2ee91c23667c3319aab8627abdfaa2ea"

  def install
    inreplace "bin/devnotes", /^CLIENT_HOME=/, "export DEVNOTES_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/devnotes"
  end

  test do
    system bin/"devnotes", "version"
  end
end
