class Devnotes < Formula
  desc "Everything you need to get started with Devnotes"
  homepage "https://github.com/edudepetris/notes-cli"
  url "https://devnotes-cli.s3.us-east-2.amazonaws.com/notes-v0.0.4/notes-v0.0.4-darwin-x64.tar.gz"
  sha256 "7b619293b71e176c6e9c11603afc918baf7404d41692294a5c0eccbb254d8e9c"

  def install
    inreplace "bin/notes", /^CLIENT_HOME=/, "export NOTES_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/notes"
  end

  test do
    system bin/"notes", "version"
  end
end
