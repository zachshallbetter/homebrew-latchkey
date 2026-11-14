class LatchkeyCli < Formula
  desc "Run commands with secrets from the Latchkey app and your keychain"
  homepage "https://latchkey.snackstud.io/"
  url "https://github.com/zachshallbetter/latchkey/releases/download/v0.3.1/latchkey-cli-0.3.1.zip"
  sha256 "bf78f2f300341e1dea6a67e5bfda39ac61513c010f0c5e51f83b51b8dbaf6247"

  depends_on :macos

  conflicts_with cask: "latchkey", because: "the Latchkey cask already installs this tool"

  def install
    bin.install "latchkey"
    bin.install_symlink "latchkey" => "lk"
  end

  def caveats
    <<~EOS
      latchkey asks the Latchkey app for every value. Install the app from the Mac App Store and open it once.
    EOS
  end

  test do
    assert_match "Latchkey", shell_output("#{bin}/latchkey help")
  end
end
