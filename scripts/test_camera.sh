#!/bin/bash
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
sdk="${SDKROOT:-/Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk}"
testbin="$(mktemp)"
trap 'rm -f "$testbin"' EXIT
xcrun swiftc -sdk "$sdk" -swift-version 5 -D DEBUG \
  "$root/notchprompt/PrompterModel.swift" \
  "$root/notchprompt/ScreenSelection.swift" \
  "$root/notchprompt/ScreenSelectionSelfTests.swift" \
  "$root/notchprompt/GlobalHotkeyManager.swift" \
  "$root/tests/CameraModeTests.swift" -o "$testbin"
"$testbin"
