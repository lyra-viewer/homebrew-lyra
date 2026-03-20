cask "lyra-viewer" do
  version "0.3.3"

  arch arm: "arm64", intel: "x64"

  sha256 arm:   "3317507f9c62ebc81fda0ab7b8d46f0edf049dd80a9a4333fa99a7ee3f112a27",
         intel: "9d2f39f53e61ddb67d42b1dc04a971f10cb76ccb8ebca589048fa65cc6a74cb3"

  url "https://github.com/lyra-viewer/Lyra/releases/download/v#{version}/LyraViewer-macos-#{arch}.zip"
  name "Lyra Viewer"
  desc "Lyra Viewer (SDL3 + SkiaSharp image viewer)"
  homepage "https://github.com/lyra-viewer/Lyra"

  depends_on formula: "sdl3"
  depends_on formula: "openexr"
  depends_on formula: "libheif"
  depends_on formula: "libde265"
  depends_on formula: "openjpeg"

  # Zips contain: LyraViewer-arm.app / LyraViewer-intel.app
  app "LyraViewer-#{arch}.app", target: "LyraViewer.app"

  zap trash: [
  "~/Library/Preferences/com.nineveh.lyraviewer.plist",
  "~/Library/Saved Application State/com.nineveh.lyraviewer.savedState",
  "~/.local/share/LyraViewer",
  "~/.config/lyra-viewer",
  "~/.local/share/lyra-viewer",
  ]
end