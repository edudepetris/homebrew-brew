class Devnotes < Formula
  desc "Everything you need to get started with Devnotes"
  homepage "https://github.com/edudepetris/notes-cli"
  url "https://devnotes-cli.s3.us-east-2.amazonaws.com/notes-v0.0.5/notes-v0.0.5-darwin-x64.tar.gz"
  sha256 "8631553b051507fc5fef883dc6b48d2d639f54e2558eda3d2689eb55611c78d4"

  def install
    inreplace "bin/notes", /^CLIENT_HOME=/, "export NOTES_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/notes"
  end

  test do
    system bin/"notes", "version"
  end
end
