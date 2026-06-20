cask "xpntl" do
  version "0.1.0"
  sha256 "3c80aa5d519cfd5cc885cda33e85c7ee53d248bfeba48def77a3992f6964d4ac"

  url "https://github.com/xpntl/xpntl-macos/releases/download/v#{version}/xpntl.dmg"
  name "xpntl"
  desc "Native macOS client for xpntl.dev"
  homepage "https://xpntl.dev"

  depends_on macos: ">= :sonoma"

  app "xpntl.app"

  zap trash: [
    "~/Library/Preferences/dev.xpntl.macos.plist",
    "~/Library/Caches/dev.xpntl.macos",
    "~/Library/Saved Application State/dev.xpntl.macos.savedState",
  ]
end
