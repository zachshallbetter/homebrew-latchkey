class LatchkeyCli < Formula
  desc "Run commands with secrets from the Latchkey app and your keychain"
  homepage "https://latchkey.snackstud.io/"
  url "https://github.com/zachshallbetter/latchkey/releases/download/v0.4.0/latchkey-cli-0.4.0.zip"
  sha256 "27d591cb2d5abc10dc88f9f04ab4cb8aa3c1c82b444e758bb0a123de54c38189"

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
