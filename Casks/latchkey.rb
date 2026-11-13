cask "latchkey" do
  version "0.2.1"
  sha256 "3ba4b04482a07b3b890590ab5900997d8298cd19d9e2caf73e0efc6affa658f2"

  url "https://github.com/zachshallbetter/latchkey/releases/download/v#{version}/Latchkey-#{version}.dmg"
  name "Latchkey"
  desc "Secrets for your Mac and your coding agents"
  homepage "https://latchkey.snackstud.io/"

  depends_on macos: ">= :sequoia"

  app "Latchkey.app"
  binary "#{appdir}/Latchkey.app/Contents/Helpers/latchkey"
  binary "#{appdir}/Latchkey.app/Contents/Helpers/latchkey", target: "lk"

  # Items stay in iCloud Keychain; remove them in the app first if you want them gone.
  zap trash: [
    "~/Library/Application Support/Latchkey",
    "~/Library/Preferences/io.snackstud.latchkey.plist",
  ]
end
