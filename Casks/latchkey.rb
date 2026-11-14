cask "latchkey" do
  version "0.3.1"
  sha256 "950461b5ca538091f40dcc065d64d99e21615a842e606f0337512e92d76c0d0e"

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
