# Notchprompt Camera

A macOS teleprompter for recording, forked from [saif0200/notchprompt](https://github.com/saif0200/notchprompt).

## Install on another Mac

The app targets macOS 14 or newer. To build it, install Apple’s Command Line
Tools or Xcode. The local build was verified with the macOS 26.5 SDK.

1. In Terminal, run `xcode-select --install` if the tools are missing and finish
   the installer. Check with `xcrun --sdk macosx --show-sdk-path`.
2. Clone the fork, build from its default branch, and open the app:

   ```sh
   git clone https://github.com/ArthurZakirov/notchprompt.git
   cd notchprompt
   bash scripts/build_local_camera.sh
   open "$HOME/Applications/Notchprompt Camera.app"
   ```

The script uses the installed macOS 26.5 SDK when available and otherwise uses
the SDK selected by Apple’s tools. If the selected SDK fails to compile, use
Apple tools that provide the verified SDK, or pass its absolute path via
`SDKROOT`. The build signs the app locally with App Sandbox enabled.

To update, quit Notchprompt Camera from its **NP** menu, then run
`git pull --ff-only` in your clone and repeat the build and open commands.

## Use Camera Mode

1. Press **Option–Command–E** to open Script Editor, then choose **Import** and select your Markdown or plain-text
   script. Scripts and settings are stored locally on each Mac.
2. In **NP → Settings → Display**, choose your display and, on a notched
   MacBook, choose **Left of cutout**, **Right of cutout**, or
   **Centered below cutout**.
3. Press **Option–Command–F** to open Camera Mode. It hides the controls and
   blacks out the surrounding displays.

| Key | Action |
| --- | --- |
| Option–Command–F | Enter or leave Camera Mode globally |
| Enter | Move text forward while Camera Mode is focused |
| Space | Move text backward while Camera Mode is focused |
| P | Start/pause automatic scrolling in Camera Mode |
| R | Reset to the beginning in Camera Mode |
| Escape | Stop playback, hide the prompt and restore the desktop |

## License

[MIT](LICENSE).
