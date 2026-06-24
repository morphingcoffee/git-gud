# git-gud

A centralized sandbox repository dedicated to deliberate practice, multi-engine tinkering, and messing around with low-level subsystems.

> "Git-gud" is the mindset here. This workspace is a structured arena to refine programming patterns, test performance boundaries, and build clean pipeline systems without the pressure of a full production release.

---

## 🧬 The Core Philosophy

Every project in this repository is a self-contained **capability drill**. The goal isn't to build sprawling, feature-crept games, but to isolate specific technical challenges—like audio routing, complex state logic, math tricks, or custom shaders—and package them into clean micro-prototypes.

To see these drills in action, they are built to be compiled and executed directly through the [GameLauncher](https://github.com/morphingcoffee/GameLauncher/releases) utility, using a quick exit handshake to drop back to the main menu selection.

---

## 🏛️ Workspace Architecture

To keep engines and raw assets from stepping on each other's toes, the repo uses a strict top-level layout:

*   **`/incubator`** — The idea lab. Where the technical requirements and scope boundaries get written down before touching a line of code.
*   **`/godot`** — Sandboxes for GDScript 2.0 experiments and component-driven node setups.
*   **`/unity`** — Sandboxes for C# paradigms, low-overhead architectures, and ScriptableObject data structures.
*   **`/art_source`** — Engine-agnostic storage for raw Blender models, master `.wav` files, and project stems. Keeps heavy source assets out of the engine compilation loops.

---

## ⚡ How to Clone Partially (Sparse Checkouts)

As this repo grows, a standard `git clone` will download a ton of heavy binary assets and music stems you might not need at that moment. If you just want to grab a single prototype folder without pulling down gigabytes of unrelated history, use this partial clone sequence:

### 1. Grab the Metadata Only
Download the commit history and folder structures, but **zero** actual file contents:
```bash
git clone --filter=blob:none --no-checkout [https://github.com/morphingcoffee/git-gud.git](https://github.com/morphingcoffee/git-gud.git)
cd git-gud