#!/usr/bin/env bash
# Build a generated iOS project for the simulator, launch it, screenshot it, and fail on a crash.
#   verify-ios.sh <project-dir> [pass|fail]
# `fail` inverts the verdict: the run succeeds only if the project does NOT build/launch cleanly
# (the negative control proving the gate can fail).
set -uo pipefail

dir="${1:?usage: verify-ios.sh <project-dir> [pass|fail]}"
expect="${2:-pass}"
name="$(basename "$dir")"
art="artifacts/$name"
mkdir -p "$art"

result="ok"
reason=""

proj="$(ls -d "$dir"/*.xcodeproj 2>/dev/null | head -1)"
if [ -z "$proj" ]; then
  result="fail"; reason="no .xcodeproj in $dir"
else
  scheme="$(basename "$proj" .xcodeproj)"
  udid="$(xcrun simctl list devices available -j | python3 -c '
import json,sys
d=json.load(sys.stdin)["devices"]
for rt,devs in sorted(d.items(), reverse=True):
    if "iOS" in rt:
        for x in devs:
            if x["name"].startswith("iPhone"):
                print(x["udid"]); raise SystemExit
')"
  if [ -z "$udid" ]; then
    result="fail"; reason="no iPhone simulator available on the runner"
  else
    echo "== xcodebuild $scheme on $udid"
    if ! xcodebuild -project "$proj" -scheme "$scheme" \
        -destination "platform=iOS Simulator,id=$udid" \
        -derivedDataPath "build/$name" CODE_SIGNING_ALLOWED=NO build \
        >"$art/xcodebuild.log" 2>&1; then
      result="fail"; reason="xcodebuild failed"
      # Surface the first compiler errors as workflow annotations (readable without downloading logs).
      grep -E "error:" "$art/xcodebuild.log" | sed 's#^.*/samples/[^/]*/##' | sort -u | head -30 \
        | while IFS= read -r line; do echo "::error::${line:0:400}"; done
      echo "::error::total error lines: $(grep -c 'error:' "$art/xcodebuild.log")"
    else
      app="$(find "build/$name/Build/Products" -maxdepth 2 -name '*.app' | head -1)"
      bundle="$(/usr/libexec/PlistBuddy -c 'Print :CFBundleIdentifier' "$app/Info.plist")"
      exe="$(/usr/libexec/PlistBuddy -c 'Print :CFBundleExecutable' "$app/Info.plist")"
      xcrun simctl boot "$udid" 2>/dev/null || true
      xcrun simctl bootstatus "$udid" -b >/dev/null 2>&1
      if ! xcrun simctl install "$udid" "$app" >"$art/install.log" 2>&1; then
        result="fail"; reason="simctl install failed"
      elif ! xcrun simctl launch "$udid" "$bundle" >"$art/launch.log" 2>&1; then
        result="fail"; reason="simctl launch failed"
      else
        sleep 8
        xcrun simctl io "$udid" screenshot "$art/launch.png" || true
        # Still running? A crashed app leaves no process and a crash report.
        if ! xcrun simctl spawn "$udid" launchctl list | grep -q "$bundle"; then
          result="fail"; reason="app is not running after launch (crashed)"
        fi
        if ls ~/Library/Logs/DiagnosticReports/"$exe"*.ips >/dev/null 2>&1; then
          cp ~/Library/Logs/DiagnosticReports/"$exe"*.ips "$art/" || true
          result="fail"; reason="crash report found for $exe"
        fi
      fi
    fi
  fi
fi

echo "$name result=$result reason=${reason:-none} expect=$expect" | tee "$art/result.txt"

if [ "$expect" = "fail" ]; then
  [ "$result" = "fail" ] && exit 0
  echo "negative control unexpectedly passed" >&2; exit 1
fi
[ "$result" = "ok" ]
