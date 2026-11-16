# Notchprompt Camera

Personal camera-mode fork of [saif0200/notchprompt](https://github.com/saif0200/notchprompt).

## Camera workflow

Open the app, then use these controls:

| Key | Action |
| --- | --- |
| Option–Command–F | Enter or leave Camera Mode globally |
| Enter | Move text forward while Camera Mode is focused |
| Space | Move text backward while Camera Mode is focused |
| P | Start/pause automatic scrolling in Camera Mode |
| R | Reset to the beginning in Camera Mode |
| Escape | Stop playback, hide the prompt and restore the desktop |

Camera Mode blacks out every connected display and places the script at the
physical top-center of the display chosen in **NP → Settings**. The first line
has no added top padding. The control row sits below the text in normal overlay
mode and is hidden in Camera Mode. **NP → Script Editor → Import** loads a script.
A camera above an external monitor is the intended setup; a physical MacBook
notch can obscure text at the top center.

## Local sandboxed build

Build from inspected sources with Apple's Command Line Tools:

```sh
bash scripts/build_local_camera.sh
```

The script uses the installed macOS 26.5 SDK by default; set `SDKROOT` to select
another compatible installed SDK. It builds only Swift sources and Apple
frameworks, creates `~/Applications/Notchprompt Camera.app`, and applies an ad-hoc
signature with App Sandbox, hardened runtime and user-selected file access.
It grants no network, microphone, camera or Accessibility entitlements. This is
a local build, not an Apple-notarized distribution, and is not a malware-free
guarantee. No Gatekeeper settings need to be disabled.

The upstream import/export feature can invoke Apple's `textutil` for office
formats. Plain-text/Markdown import is the tested workflow; office conversion
and capture invisibility are not guaranteed.

## Upstream features

<p align="center">
  <img src="assets/banner.png" alt="Notchprompt Banner" width="100%">
</p>

Native macOS notch-adjacent teleprompter for presentations and recordings.

## Quick Demo

> Demo assets below are placeholders. Replace with real captures before public
> launch.

<!--
![Notchprompt hero screenshot](docs/media/hero.png)
*Hero view of the overlay panel and settings workflow.*

![Notchprompt scrolling demo GIF](docs/media/notchprompt-demo.gif)
*In-use scrolling demo with start/pause and speed adjustments.*
-->

## Features

- Menu bar utility workflow (`NP` status item).
- Notch-adjacent floating overlay with transport controls.
- Start/pause, reset, and jump back 5 seconds.
- Adjustable speed, font size, overlay width, and overlay height.
- Optional countdown before scrolling starts.
- Import/export plain text scripts.
- Privacy mode (`NSWindow.SharingType`, best-effort/app-dependent).

## Requirements

- macOS version supported by the current deployment target in
  `notchprompt.xcodeproj`.
- Apple Silicon or Intel Mac.

## Install (Recommended)

1. Open GitHub Releases:
   `https://github.com/saif0200/notchprompt/releases`
2. Download the latest `.dmg` release asset.
3. Open the DMG and drag `notchprompt.app` to `Applications`.
4. Launch `notchprompt.app`.

### Unsigned Build Note

This build is currently unsigned/unnotarized, so macOS may show security prompts.

If macOS shows:

- `Apple could not verify "notchprompt" is free of malware...`
- or `"notchprompt" is damaged and can’t be opened`

run:

```bash
xattr -cr /Applications/notchprompt.app
open /Applications/notchprompt.app
```

If it is still blocked:

1. Open `System Settings -> Privacy & Security`.
2. Click **Open Anyway** for `notchprompt`.
3. Launch again.

## Keyboard Shortcuts

| Shortcut | Action |
| --- | --- |
| `⌥⌘P` | Start / Pause |
| `⌥⌘R` | Reset scroll |
| `⌥⌘J` | Jump back 5s |
| `⌥⌘H` | Toggle Privacy Mode |
| `⌥⌘=` | Increase speed |
| `⌥⌘-` | Decrease speed |

## Build From Source

```bash
git clone https://github.com/saif0200/notchprompt.git
cd notchprompt
open notchprompt.xcodeproj
```

CLI build:

```bash
xcodebuild -project notchprompt.xcodeproj -scheme notchprompt -configuration Debug build
```

## License

MIT. See `LICENSE`.
