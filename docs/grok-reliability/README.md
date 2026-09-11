# For the MBP Grok session

You cloned `ganidhu/fire-from-ice` at `2130834` and do not have the other session's artifacts folder. This folder **is** that pack.

```bash
git fetch origin reliability/session-pack
git checkout reliability/session-pack
# this README lives at docs/grok-reliability/
```

Apply onto a working branch from fire/main:

```bash
git checkout fire/main
git checkout -b grok/reliability
cp docs/grok-reliability/patches/ScreenCapture.swift          Ice/Utilities/ScreenCapture.swift
cp docs/grok-reliability/patches/MenuBarLayoutStore.swift     Ice/MenuBar/MenuBarItems/MenuBarLayoutStore.swift
cp docs/grok-reliability/patches/MenuBarSearchPanel.swift     Ice/MenuBar/Search/MenuBarSearchPanel.swift
```

Then apply, in order:
1. `docs/grok-reliability/HANDOFF.md`
2. `docs/grok-reliability/patches/SURGICAL_DIFFS.md`
3. `docs/grok-reliability/patches/IDLE_AND_CLICK.md`

Compile fixes to expect:
- `MenuBarItem.getMenuBarItems` is `async` on this tree. Await it in `LiveIndex`.
- Add `Defaults.Key.restoreItemLayoutOnLaunch` and `Defaults.Key.menuBarLayoutSnapshotV1` (or `lastSessionLayout`) in `Ice/Utilities/Defaults.swift`.
- `layoutStore.performSetup(with:)` after `itemManager.performSetup`.

Do not overwrite EventTap. Do not cache live menu-bar item frames. New Ice/*.swift files need no pbxproj edit.

Build unsigned Debug on the Mac. Push only to `ganidhu/fire-from-ice`.
