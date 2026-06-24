# Agent plan

Cursor-facing source of truth for repo structure, constraints, and current priorities.
Public overview: [README.md](../README.md).

---

## Two repositories

| Repo | Role |
|------|------|
| **git-gud** (this repo) | Factory — specs in `incubator/`, runnable katas in `katas/` |
| **[GameLauncher](https://github.com/morphingcoffee/GameLauncher)** | Orchestrator — catalog, download, install, **launch** exported builds via R2 |

No shared local directories. Graduated katas ship to GameLauncher through the manifest + R2 deploy pipeline (`morphingcoffee/GameLauncher` → `tools/deploy/`).

**Integration scope (now):** launch only. GameLauncher starts the exported executable and waits for the process to exit. No exit payload, score handoff, or IPC contract at this stage.

---

## Canonical directory layout

```text
/
├── .cursor/
│   └── skills/              # Committed agent skills (e.g. github-gh-cli)
├── .cursorrules             # Public Cursor persona (not created yet)
├── .gitignore
├── README.md                # Public repo overview
├── docs/
│   └── PLAN.md              # This file
├── incubator/               # Specs only — no engine projects here
│   ├── 01_evening_news/
│   ├── 02_under_ceiba_canopy/
│   ├── 03_cathode_afterglow/
│   └── template.md
├── katas/                   # Runnable engine projects
│   ├── godot/               # Godot 4.x katas (active track)
│   ├── unity/               # Placeholder — deferred until Path to CoreCLR
│   └── unrealengine/        # Placeholder — not started
├── art_assets/              # Engine-agnostic source art (not engine caches)
│   ├── blender/
│   ├── textures/
│   └── audio/
```

**Why `katas/` at the root:** keeps `incubator/` (paper) separate from `katas/` (code). Matches the repo philosophy — each folder is a technical drill, not a production game.

**Graduation path:** `incubator/NN_name/` spec → `katas/<engine>/NN_name/` project → desktop export → GameLauncher manifest entry.

---

## Kata roadmap

| # | ID | Kata path | State | Technical focus |
|---|-----|-----------|-------|-----------------|
| 01 | `evening_news` | `katas/godot/01_evening_news` | Incubator | Audio Server DSP, band-pass filters, pre-set validation, Blender import |
| 02 | `under_ceiba_canopy` | `katas/godot/02_under_ceiba_canopy` | Incubator | `PathFollow2D`, velocity→audio telemetry, exit-guess UI |
| 03 | `cathode_afterglow` | `katas/godot/03_cathode_afterglow` | Incubator | `RigidBody3D` throws, spatial audio collision matrix, 90s session loop |

Which kata graduates first is **user's choice** — no default ordering beyond the numeric IDs in `incubator/`.

---

## GameLauncher shipping checklist (per kata)

When a kata is export-ready:

1. Desktop export (Windows and/or macOS) with a stable `executable_path` inside the zip layout GameLauncher expects.
2. Register in `GameLauncher/manifests/` and deploy via existing R2 pipeline.
3. Confirm launch from an installed GameLauncher build — process starts, player quits, launcher regains focus.

Do not block shipping on score telemetry, result JSON, or custom CLI flags.

---

## Deferred engine tracks

| Path | Status |
|------|--------|
| `katas/unity/` | Structure only — **no projects until Path to CoreCLR completes** |
| `katas/unrealengine/` | Structure only — **not started**; do not scaffold without explicit request |

---

## Design constraints

Every kata is a **technical drill**, not a full game.

- **Anti-brute-force:** puzzles must be closed, deterministic, deductive systems — not reflex click-fests or untrackable chaos.
- **Scope gates** in each incubator spec are hard limits; do not expand without explicit user request.
- **Godot 4.x:** strict static typing on variables, parameters, and returns.
- **Assets:** prefer proper Blender → export → import over permanent engine primitives when the spec calls for real meshes.

---

## Cursor persona (`.cursorrules` — planned)

Promote this block to root `.cursorrules` when the first kata lands in `katas/`.

**Socratic Engineering Mentor** — enforce rigorous habits and architectural integrity across katas and asset pipelines.

### Pedagogical rules

1. **No lazy code dumps:** do not deliver massive end-to-end script refills unless explicitly ordered. Break systems into architectural concepts first.
2. **Socratic gatekeep:** before complex implementations, challenge with concise micro-quizzes on state machines, vector math, or memory management. Ensure the user understands *why*.
3. **Rigorous explanations:** explain underlying mechanics (Godot Audio Server routing, C# GC behavior, mesh vertex colors, etc.). Doing things the right way is mandatory.

### Pipeline and engineering rigor

1. **Complete workflows:** when a spec calls for real assets, use Blender → export → import. Do not leave permanent primitive blocks as stand-ins.
2. **Type-safety:** Godot 4.x static typing everywhere; Unity — SOLID, zero GC allocations in hot update loops (when that track opens).
3. **Constraint fidelity:** reject casual reflex loops and chaotic untrackable states.

---

## Ignore policy

| File | Role |
|------|------|
| `.gitignore` | Git — engine caches, IDE scratch, Blender autosaves |
| `.cursorignore` | Cursor — hard block on caches + `art_assets/` media (committed but not AI context) |

| Git-ignore / cursor-ignore | Track |
|----------------------------|-------|
| `.godot/`, `builds/`, Unity `Library/`/`Temp/`/`Obj/`, Unreal `Intermediate/`/`Saved/` | `.cursor/skills/` |
| `.vscode/`, `.idea/`, IDE planning scratch | `.cursorrules` when added |
| `.cursor_plan/`, `cursor-history/`, `.cursor-tasks.json` | `incubator/`, `katas/` project sources |
| Blender autosave/numbered backups under `art_assets/` | `art_assets/` master sources (in git; blocked from Agent via `.cursorignore`) |

---

## Current status

- **Done:** three incubator specs, `katas/` structure (godot / unity / unrealengine), `art_assets/` stubs, `github-gh-cli` skill, this plan.
- **Not started:** all `katas/<engine>/*` projects, `.cursorrules`, `art_assets` content, GameLauncher manifest entries for git-gud katas.
- **Next:** user picks which incubator spec to graduate — scaffold `katas/<engine>/NN_<name>/` and implement that spec's Phase 1 MVP.
