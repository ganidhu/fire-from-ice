# For the MBP Grok session

```bash
git fetch origin
git checkout reliability/session-pack
ls artifacts/fire-reliability/patches
```

Expected files:
- ScreenCapture.swift
- MenuBarLayoutStore.swift
- MenuBarSearchPanel.swift
- SURGICAL_DIFFS.md
- IDLE_AND_CLICK.md

Then:

```bash
git checkout -b grok/reliability fire/main
cp artifacts/fire-reliability/patches/ScreenCapture.swift Ice/Utilities/ScreenCapture.swift
cp artifacts/fire-reliability/patches/MenuBarLayoutStore.swift Ice/MenuBar/MenuBarItems/MenuBarLayoutStore.swift
cp artifacts/fire-reliability/patches/MenuBarSearchPanel.swift Ice/MenuBar/Search/MenuBarSearchPanel.swift
```

Apply SURGICAL_DIFFS.md then IDLE_AND_CLICK.md. Build unsigned Debug. Push only to ganidhu/fire-from-ice.
