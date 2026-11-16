#!/bin/bash
set -euo pipefail
# Build only local Swift sources and Apple frameworks; no package or script downloads.
root="$(cd "$(dirname "$0")/.." && pwd)"
out="${1:-$HOME/Applications/Notchprompt Camera.app}"
sdk="${SDKROOT:-/Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk}"
test -d "$sdk" || { echo 'Set SDKROOT to an installed macOS SDK.' >&2; exit 1; }
mkdir -p "$out/Contents/MacOS" "$out/Contents/Resources"
xcrun swiftc -sdk "$sdk" -target "$(uname -m)-apple-macosx14.0" -swift-version 5 -O -parse-as-library "$root"/notchprompt/*.swift -o "$out/Contents/MacOS/notchprompt"
cat > "$out/Contents/Info.plist" <<'PLIST'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0"><dict>
<key>CFBundleIdentifier</key><string>local.notchprompt.camera</string>
<key>CFBundleName</key><string>Notchprompt Camera</string>
<key>CFBundleExecutable</key><string>notchprompt</string>
<key>CFBundlePackageType</key><string>APPL</string>
<key>CFBundleVersion</key><string>1</string>
<key>CFBundleShortVersionString</key><string>1.0</string>
<key>LSMinimumSystemVersion</key><string>14.0</string>
<key>LSUIElement</key><true/>
<key>NSHighResolutionCapable</key><true/>
</dict></plist>
PLIST
entitlements="$(mktemp)"
trap 'rm -f "$entitlements"' EXIT
cat > "$entitlements" <<'PLIST'
<?xml version="1.0" encoding="UTF-8"?>
<plist version="1.0"><dict>
<key>com.apple.security.app-sandbox</key><true/>
<key>com.apple.security.files.user-selected.read-write</key><true/>
</dict></plist>
PLIST
cp "$root/LICENSE" "$out/Contents/Resources/LICENSE"
git -C "$root" rev-parse HEAD > "$out/Contents/Resources/SourceRevision.txt"
codesign --force --sign - --options runtime --entitlements "$entitlements" "$out"
codesign --verify --strict "$out"
printf 'Built %s\n' "$out"
