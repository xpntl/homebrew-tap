cask "xpntl" do
  version "1.5.0"
  sha256 "0ff301454326053919762c08536b6aec3a9f7e0937415dfd5fc577b2379c353a"

  url "https://dl.xpntl.dev/clients/macos/xpntl-#{version}.dmg"
  name "xpntl"
  desc "Project tracker with issues, cycles, and agents"
  homepage "https://xpntl.ai/"

  # The old check was `strategy :github_latest` against xpntl/xpntl-ios, which
  # could never work: that strategy reads GitHub *releases*, the repo has only
  # tags, and it is private — so neither Homebrew's CI nor a user's machine can
  # see it. Every version bump had to be hand-edited.
  #
  # The release workflow already publishes a public manifest next to the DMG, so
  # read that instead. Scoped to the "macos" block on purpose: a bare
  # /"version"/ would start matching windows once that ships.
  #
  # Deliberately dl.xpntl.dev, not .ai. That host is what actually serves;
  # dl.xpntl.ai only 301s to it, and a package manager should not depend on a
  # redirect to fetch a binary or read a version. Same reasoning that keeps
  # api/mcp on .dev after the xpntl.ai move: humans get redirected, machines
  # get a stable host. Only `homepage` moved, because that is for people.
  livecheck do
    url "https://dl.xpntl.dev/clients/version.json"
    strategy :page_match
    regex(/"macos"\s*:\s*\{[^}]*?"version"\s*:\s*"(\d+(?:\.\d+)+)"/m)
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
