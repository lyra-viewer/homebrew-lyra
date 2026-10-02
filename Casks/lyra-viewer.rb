cask "lyra-viewer" do
  version "0.6.0"

  arch arm: "arm64", intel: "x64"

  sha256 arm:   "e4df59210e5fec403821276a7bab4cf5c877538c9ba9ff075d12ea20f306727a",
         intel: "95ffcd9d318095ace1732193242f3bb832816ff8a41748e95b2c852a65574f29"

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