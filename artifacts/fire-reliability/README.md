# Fire reliability pack

```bash
git fetch origin && git checkout reliability/session-pack
ls artifacts/fire-reliability/patches
```

Apply from repo root:

```bash
cp artifacts/fire-reliability/patches/ScreenCapture.swift Ice/Utilities/ScreenCapture.swift
cp artifacts/fire-reliability/patches/MenuBarLayoutStore.swift Ice/MenuBar/MenuBarItems/MenuBarLayoutStore.swift
cp artifacts/fire-reliability/patches/MenuBarSearchPanel.swift Ice/MenuBar/Search/MenuBarSearchPanel.swift
```

Then apply SURGICAL_DIFFS.md and IDLE_AND_CLICK.md in that folder.
Read HANDOFF.md first. Do not cache live item frames. Do not overwrite EventTap.
