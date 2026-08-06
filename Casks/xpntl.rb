cask "xpntl" do
  version "1.3"
  sha256 "61286160822607bca93e10f0d203b372f968aa17f741129cbf7283615032dc86"

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
