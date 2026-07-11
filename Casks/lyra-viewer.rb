cask "lyra-viewer" do
  version "0.5.0"

  arch arm: "arm64", intel: "x64"

  sha256 arm:   "2a8efdc77213b611d6996033ac222d979b892db0d3491ea6ad676466b032a6f1",
         intel: "f61f4afd5562a154b82c0c48ba55632fe61831e080e7ed7cc5a2a3227b36c96b"

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