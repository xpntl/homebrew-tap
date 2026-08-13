cask "xpntl" do
  version "1.4.1"
  sha256 "566cf9368f647cecc824e7b5dec75e92a51fc8a07f1506da2a3763fea2bd8f5b"

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
