# Learning log — 01 Evening News

**Next:** Step **4** — gym DSP (audio bus, static feed, knobs — Subsystem A)

## Done

| Area | State |
|------|--------|
| Project shell | Godot **4.7**, Forward+. Commit `2aa3cdb`. |
| Boot | `scenes/boot.tscn` + `ui/dev_boot_theme.tres`. Commit `c547c9a`. |
| Themes | Quiz passed — Theme on Boot; inheritance + overrides cleared. |
| Gym shell | `scenes/gym/dsp_bench.tscn` — `DspBench` + `Camera3D` + box placeholder. |
| Scene switch | `scenes/boot.gd` — `GymDspBench.pressed` → `change_scene_to_file` gym. |

## Not done

- Level button unwired; `scenes/level/` empty
- DSP / Subsystem A, Level Phase 1

## Decisions

- Boot = 2D dev picker; gym = 3D; level = GameLauncher ship target (not boot).
- `extends Control` on boot script matches Boot node type.
- Mac run shortcuts: **⌘B** project, **⌘A** current scene (not F5/F6).

## Quiz signal

- Conflated git with runtime on theme question — cleared.
- Gym root why: Control = flat UI; gym = spatial world (camera/meshes later).

---

*Append: milestone, commit, quiz gap, kata-specific decision only.*
