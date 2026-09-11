# For the MBP Grok that cloned this repo

You said the session pack was missing. It is now on this branch:

```
git fetch origin
git checkout reliability/session-pack
```

The pack lives at `artifacts/fire-reliability/` (this folder). It is **not** applied to Ice sources yet.

## Apply (do this on the Mac)

Read `artifacts/fire-reliability/HANDOFF.md` first. Then:

```bash
cp artifacts/fire-reliability/patches/ScreenCapture.swift \
   Ice/Utilities/ScreenCapture.swift
cp artifacts/fire-reliability/patches/MenuBarLayoutStore.swift \
   Ice/MenuBar/MenuBarItems/MenuBarLayoutStore.swift
cp artifacts/fire-reliability/patches/MenuBarSearchPanel.swift \
   Ice/MenuBar/Search/MenuBarSearchPanel.swift
```

Then apply the surgical edits in:
- `artifacts/fire-reliability/patches/SURGICAL_DIFFS.md`
- `artifacts/fire-reliability/patches/IDLE_AND_CLICK.md`

Intent over exact text if a symbol moved.

Do **not** overwrite EventTap, do **not** cache live item frames, do **not** route last-session restore through MCP `apply_layout`.

Compile:

```bash
DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer xcodebuild \
  -project Ice.xcodeproj -scheme Ice -configuration Debug \
  -destination 'platform=macOS' \
  CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO build
```

FireLogic planner (optional unit tests):
```
cp artifacts/fire-reliability/FireLogic/LayoutRestorePlanner.swift \
   FireLogic/Sources/FireLogic/LayoutRestorePlanner.swift
cp artifacts/fire-reliability/FireLogic/LayoutRestorePlannerTests.swift \
   FireLogic/Tests/FireLogicTests/LayoutRestorePlannerTests.swift
```
Do not ship both planners — Ice uses `MenuBarLayoutStore.swift` only.

When compile + smoke look good, commit on this branch and leave `fire/main` clean until then.
