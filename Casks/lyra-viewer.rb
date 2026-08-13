cask "lyra-viewer" do
  version "0.5.2"

  arch arm: "arm64", intel: "x64"

  sha256 arm:   "81f372337883484711748917a8b032b575f75ddfc0c27d08f3e975d9cac1fac5",
         intel: "99ec62e22d2635cdf3bd789b9f0a16a0fd47c39d4d07bf79cf8b516e21c157f9"

  url "https://github.com/lyra-viewer/Lyra/releases/download/v#{version}/LyraViewer-macos-#{arch}.zip"
  name "Lyra Viewer"
  desc "Lyra Viewer (SDL3 + SkiaSharp image viewer)"
  homepage "https://github.com/lyra-viewer/Lyra"

  depends_on formula: "sdl3"
  depends_on formula: "openexr"
  depends_on formula: "libheif"
  depends_on formula: "libde265"
  depends_on formula: "openjpeg"
  depends_on formula: "libtiff"
  depends_on formula: "jpeg-xl"
  depends_on formula: "zstd"

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