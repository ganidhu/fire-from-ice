# Fire reliability pack

For local Grok on the MBP. Base is pdurlej/fire-from-ice fire/main, not jordanbaird/Ice.
Pack lives on ganidhu/fire-from-ice branch reliability/session-pack under artifacts/fire-reliability/.

```bash
git fetch origin
git checkout reliability/session-pack
ls artifacts/fire-reliability/patches
```

This sandbox is Linux. Nothing compiled. You xcodebuild on the Mac.

```bash
DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer xcodebuild \
  -project Ice.xcodeproj -scheme Ice -configuration Debug \
  -destination 'platform=macOS' \
  CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO build
```

New .swift files under Ice/ need no pbxproj edit (synchronized groups).

Drop-in store is artifacts/fire-reliability/patches/MenuBarLayoutStore.swift.

Do not push to jordanbaird/Ice. Do not overwrite Fire EventTap, live item-frame query, or MCP consent/XPC.

## Apply order

```bash
cp artifacts/fire-reliability/patches/ScreenCapture.swift          Ice/Utilities/ScreenCapture.swift
cp artifacts/fire-reliability/patches/MenuBarLayoutStore.swift     Ice/MenuBar/MenuBarItems/MenuBarLayoutStore.swift
cp artifacts/fire-reliability/patches/MenuBarSearchPanel.swift     Ice/MenuBar/Search/MenuBarSearchPanel.swift
```

Then apply artifacts/fire-reliability/patches/SURGICAL_DIFFS.md and IDLE_AND_CLICK.md.
