# Ice-main pack → Fire

| Ice-main change | Fire? | Action |
|---|---|---|
| EventTap retain leak + re-enable | Already better (isActive, FIRE-N) | Leave |
| Image cache eviction | Already (#804 adapted) | Cap only |
| Smart-rehide off-main WindowInfo | Already (FIRE-M) | Leave |
| App-menu frame cache | Already (#17) | Leave |
| Live item-frame cache | Fire tried it, broke hover | Do not reintroduce |
| ScreenCapture title==permission | Still broken on Tahoe | Replace file |
| Hover Task-per-pixel | Still broken | Surgical HIDEventManager |
| LayoutBar cacheFailed blanks pane | Still broken | Surgical |
| LayoutBarItemView frame .zero | Still broken | Surgical |
| IceBar show race + dynamic SLS origin | Still broken | Surgical |
| ControlItem reentrancy | Still missing | Surgical |
| Section transition serialize | Still missing | Surgical |
| Sparkle startingUpdater: true | Still true | Surgical |
| Overlay 5s wallpaper + 1ms loop | Still there | Surgical |
| Last-session order restore | Missing (MCPLayouts is named/explicit) | New MenuBarLayoutStore |

Fire-only leftover (not in this pack; needs owner's signed machine):

- #5 sendSync timeout (DEADLOCK TRAP, 10.8 candidate)
- #7 cheaper live item query if it ever hangs
- #11 remaining light main-thread SLS (SearchPanel, IceBar getOrigin — getOrigin fixed here)
- #13 a11y labels
