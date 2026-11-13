cask "latchkey" do
  version "0.3.0"
  sha256 "b268905738b1b8004e241ea2adb3babb0255e46bbdd61b0c287e86b5b24ab84b"

  url "https://github.com/zachshallbetter/latchkey/releases/download/v#{version}/Latchkey-#{version}.dmg"
  name "Latchkey"
  desc "Secrets for your Mac and your coding agents"
  homepage "https://latchkey.snackstud.io/"

  depends_on macos: :sequoia

  app "Latchkey.app"
  binary "#{appdir}/Latchkey.app/Contents/Helpers/latchkey"
  binary "#{appdir}/Latchkey.app/Contents/Helpers/latchkey", target: "lk"

  # Items stay in iCloud Keychain; remove them in the app first if you want them gone.
  zap trash: [
    "~/Library/Application Support/Latchkey",
    "~/Library/Preferences/io.snackstud.latchkey.plist",
  ]
end
