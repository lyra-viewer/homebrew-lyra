cask "lyra-viewer" do
  version "0.3.0"

  arch arm: "arm64", intel: "x64"

  sha256 arm:   "6a7d61cc2faf2b08a6fcbf9c64b09bec6a9af53c3a7e5a6253c3b79a2293cfa7",
         intel: "56bf39a65eaf15fa5c7a3e43e9cf83ffd67be88dcc151315e878dc0d08a054d7"

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