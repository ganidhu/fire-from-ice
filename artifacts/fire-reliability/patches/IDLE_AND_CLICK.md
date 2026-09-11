# Idle RAM + click latency

Apply on top of SURGICAL_DIFFS.md.

## IceBar show first

In IceBar.swift show(section:on:), set contentView, updateOrigin, colorManager, orderFrontRegardless BEFORE cache. Then Task { cacheItemsIfNeeded; updateCache } guarded by showGeneration token.

## HIDEventManager handleShowOnClick

Call targetSection.toggle() synchronously. No wrapping Task.

## AppState

Remove `.merge(with: Just(true).delay(for: 1, scheduler: DispatchQueue.main))` so launch does not force a full image capture with Settings closed.

## MenuBarItemImageCache

Drop Timer.publish(every: 3). On Settings/IceBar/Search close, sleep 20s then images.removeAll if still idle.

## Overlay

Wallpaper timer 5s -> 30s. Theme loop once. App-menu initial poll 1ms -> 150ms.

## MenuBarGeometryCache

Timer 2s -> 8s.

## Search panel

show(on:) must orderFront before await updateCache. Chrome rewrite is patches/MenuBarSearchPanel.swift.
