cask "lyra-viewer" do
  version "0.5.1"

  arch arm: "arm64", intel: "x64"

  sha256 arm:   "17ac0140b9be50f625b236324bdc82057078d1ec80c2f42506baf2df0a4eff51",
         intel: "b52ad648977082e4b104bae5812ec259cc77be1b62491878fd33070f80b053b8"

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