cask "xpntl" do
  version "1.2"
  sha256 "aea73508ad27a59eef3c977d3fd450d1995f3e7642df54f1c095f4d2bf8405bf"

  url "https://dl.xpntl.dev/clients/macos/xpntl-#{version}.dmg"
  name "xpntl"
  desc "Project tracker with issues, cycles, and agents"
  homepage "https://xpntl.dev/"

  livecheck do
    url "https://github.com/xpntl/xpntl-ios"
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "xpntl.app"

  zap trash: [
    "~/Library/Caches/dev.xpntl.ios",
    "~/Library/Preferences/dev.xpntl.ios.plist",
    "~/Library/Saved Application State/dev.xpntl.ios.savedState",
    # Retired identifier — kept so upgrading from a dev.xpntl.macos install
    # still cleans up after itself.
    "~/Library/Caches/dev.xpntl.macos",
    "~/Library/Preferences/dev.xpntl.macos.plist",
    "~/Library/Saved Application State/dev.xpntl.macos.savedState",
  ]
end
