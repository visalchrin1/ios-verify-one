# OneNative iOS verification

Public repo that proves OneNative's **generated iOS output** builds and launches. It exists only because `xcodebuild` and the iOS Simulator need macOS and GitHub gives public repos free macOS runners.

It contains generated output for open-source sample apps, nothing else. OneNative's own source is not here. Each sample's upstream project and licence are listed in `SAMPLES.md`.

- `samples/<name>/` must build, launch and stay running. The workflow fails otherwise.
- `expect-fail/<name>/` is deliberately broken output. The workflow passes only if it fails, which shows the gate can catch a bad conversion.
- Each run uploads `xcodebuild.log`, a launch screenshot and a result line as artifacts.

Files here are written by OneNative's `tools/ios-verify/Publish-IosOutput.ps1`; do not edit them by hand.

## Per-screen captures (ticket 18)

A sample published with `Publish-IosOutput.ps1 -Capture` (OneNative `--ui-capture`) has a `<Name>UITests` folder. After the launch check, `verify-ios.sh` runs
`xcodebuild test`: the UI test opens each screen (`-OneNativeScreen <name>`) and writes `<screen>.png` and `<screen>.tree.json` (`{"text","tappable","children"}`)
into `artifacts/<sample>/screens/`. A missing or one-colour screenshot fails the job. Download the workflow artifact, then compare against the Android captures of the
same screens with OneNative's parity command (`OneNative parity <android-captures> <ios-captures>`; see `tools/uikit-acceptance` for the Android side).
