cask "lyra-viewer" do
  version "0.2.1"

  arch arm: "arm64", intel: "x64"

  sha256 arm:   "818dfc83cbc0ee3f4b4ade1a40dd94de110e976e9db47e4b0db95c09012e3a07",
         intel: "ba58366984a255db5a7cc5cafb7ff9fdd603449641b8642761e7d5388a3afa24"

  url "https://github.com/lyra-viewer/Lyra/releases/download/v#{version}/LyraViewer-macos-#{arch}.zip"
  name "Lyra Viewer"
  desc "Lyra Viewer (SDL3 + SkiaSharp image viewer)"
  homepage "https://github.com/lyra-viewer/Lyra"

  depends_on formula: "sdl3"
  depends_on formula: "openexr"
  depends_on formula: "libheif"
  depends_on formula: "libde265"

  # Zips contain: LyraViewer-arm.app / LyraViewer-intel.app
  app "LyraViewer-#{arch}.app", target: "LyraViewer.app"

  zap trash: [
  "~/Library/Preferences/com.nineveh.lyraviewer.plist",
  "~/Library/Saved Application State/com.nineveh.lyraviewer.savedState",
  "~/.local/share/LyraViewer",
  ]
end