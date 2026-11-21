cask "latchkey" do
  version "0.4.0"
  sha256 "cc28ab14f6714153d0de9bef921738b51441b21489a3525a117087d58ed90675"

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
