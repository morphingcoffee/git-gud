# Learning log — 01 Evening News

**Next:** sync slider defaults from bus FX on load; then CanvasLayer for dev sliders or 3D knobs

## Done

| Area | State |
|------|--------|
| Boot + gym | boot → gym; `crt.tscn` instanced in `dsp_bench.tscn` (camera gym-only) |
| Audio | `audio/` + attribution; `Bench` → Amplify → BandPass → Panner |
| CRT + DSP | `crt.gd` — three 0–1 sliders → `volume_db`, `cutoff_hz`, `pan` via `_map_range` |

## Near future (not blocking)

- **Slider init** — on load, set each HSlider from current effect value (`inverse_lerp` / `remap`) so first touch doesn’t jump.
- **CanvasLayer** — dev sliders under `Node3D` work for now; move to gym `CanvasLayer` when polishing UI (Controls want 2D GUI layer, not 3D parent).
- **3D knobs** — replace sliders; rotation drives same `_map_range` paths.
- Level button; `scenes/level/`; Subsystem B.

## Decisions

- Reusable `crt.tscn`; gym = thin wrapper.
- `cutoff_hz` not `center_hz`; clamp warning = upstream bug signal.
- Effect lookup by index OK for single-instance Bench chain; type-scan helper optional later.

## Quiz signal

- Bus = isolated FX chain.
- `get_bus_effect()` → type hint for autocomplete.

---

*Append: milestone, commit, quiz gap, kata-specific decision only.*
