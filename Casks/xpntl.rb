cask "xpntl" do
  version "0.2.0"
  sha256 "cf86760c031dfa3391666af4a2d78b4bf79095557c058ace31e5f4324885d3dd"

  url "https://dl.xpntl.dev/clients/macos/xpntl-#{version}.dmg"
  name "xpntl"
  desc "Project tracker with issues, cycles, and agents"
  homepage "https://xpntl.dev/"

  livecheck do
    url "https://github.com/xpntl/xpntl-macos"
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "xpntl.app"

  zap trash: [
    "~/Library/Caches/dev.xpntl.macos",
    "~/Library/Preferences/dev.xpntl.macos.plist",
    "~/Library/Saved Application State/dev.xpntl.macos.savedState",
  ]
end
