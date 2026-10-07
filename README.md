# OneNative iOS verification

Public repo that proves OneNative's **generated iOS output** builds and launches. It exists only because `xcodebuild` and the iOS Simulator need macOS and GitHub gives public repos free macOS runners.

It contains generated output for open-source sample apps, nothing else. OneNative's own source is not here. Each sample's upstream project and licence are listed in `SAMPLES.md`.

- `samples/<name>/` must build, launch and stay running. The workflow fails otherwise.
- `expect-fail/<name>/` is deliberately broken output. The workflow passes only if it fails, which shows the gate can catch a bad conversion.
- Each run uploads `xcodebuild.log`, a launch screenshot and a result line as artifacts.

Files here are written by OneNative's `tools/ios-verify/Publish-IosOutput.ps1`; do not edit them by hand.
