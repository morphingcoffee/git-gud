---
name: kata-gym-level
description: >-
  Gym vs Level workflow for git-gud katas. Use when graduating an incubator
  spec, scaffolding katas/godot projects, or implementing kata mechanics —
  decide gym stations, build gym or level, and what ships to GameLauncher.
---

# Kata gym and level

## Terms

| Term | What it is |
|------|------------|
| **Gym** | Dev station — unpolished, one mechanic (or small cluster) interactable in isolation. Debug-friendly; polish optional. |
| **Level** | Composed experience — incubator **Phase 1 MVP** with real constraints, presentation, and win/exit state. |

No shared gym framework. Each kata owns its own scenes/scripts.

**GameLauncher note:** [`arcade_gym`](https://github.com/morphingcoffee/GameLauncher) shipped a gym because no level existed yet. Same rule here: ship **level** when ready; ship **gym** only as a temporary catalog entry if the level is not done.

---

## Before writing code

1. Read `incubator/NN_<name>/` spec.
2. List **Subsystem A/B/C** — candidate gym stations.
3. Read **MVP Scope (Phase 1)** — that defines the **level**.
4. Decide **gym: yes / thin / skip** (see below).
5. **Ask or infer:** is this session building **gym** or **level**? Do not mix both without stating which.

### First time on an engine track

If the user has not created a project in this engine for this repo yet, follow [learn-or-delegate](../learn-or-delegate/SKILL.md) **before** writing `project.godot`, scenes, or folder scaffolds. Picking a kata number is not permission to skip that gate.

---

## Gym decision

| Verdict | When |
|---------|------|
| **Yes** | 2+ separable subsystems (e.g. cathode: throw, rim audio, net audio, timer) |
| **Thin** | One integrated loop but a debug/calibration scene helps (e.g. knobs without validation gate) |
| **Skip** | Single inseparable loop; gym would duplicate the level |

Document the choice in the kata README (`katas/<engine>/NN_<name>/README.md`) with a short station list when gym applies.

---

## Godot layout (convention)

```text
katas/godot/NN_<name>/
  README.md           # gym verdict + station list + level scope pointer
  scenes/
    gym/              # optional — one scene per station or one hub scene
    level/            # Phase 1 MVP
```

Boot flow: dev picker (gym vs level) or separate export presets. Default **GameLauncher export = level**.

---

## Build order

1. **Gym stations** — prove each subsystem; visuals on; forgiving rules OK.
2. **Level** — compose stations under spec constraints (occlusion, timers, validation gates, etc.).
3. **Ship** — level export → manifest. Gym stays dev-only unless user explicitly ships it interim.

When user picks a kata to start, prefer **gym first** if gym verdict is yes/thin and subsystems are not proven yet.

---

## Session discipline

At the start of implementation work, state explicitly:

```text
Mode: gym | level
Target: <station name or "Phase 1 MVP">
```

If scope is unclear, ask before coding. Scope gates in the incubator spec are hard limits for **level**; gym may relax them only for isolation testing.

---

## Examples (this repo)

| Kata | Gym | Stations (if gym) | Level |
|------|-----|-------------------|-------|
| `01_evening_news` | Thin | DSP knobs/filters, no validation gate | Pre-set gate + single puzzle matrix |
| `02_under_ceiba_canopy` | Yes | path visible, audio-only run, guess UI alone | canopy + listen + mark exit |
| `03_cathode_afterglow` | Yes | throw, backboard/rim/net audio, timer | blackout + 90s composed loop |

---

## Incubator specs

New specs should fill the **Gym** and **Level** sections in [`incubator/template.md`](../../incubator/template.md). Existing specs may be updated when that kata graduates.
