# git-gud

A centralized sandbox repository dedicated to deliberate practice, multi-engine tinkering, and messing around with low-level subsystems.

***💡 Get good is the mindset here. This workspace is a structured arena to refine programming patterns, test performance boundaries, and build clean pipeline systems without the pressure of a full production release.***


## 🧬 The Core Philosophy

Every project in this repository is a self-contained **technical kata**. The goal isn't to build sprawling, feature-crept games, but to isolate specific challenges—like audio routing, complex state logic, math tricks, or custom shaders—and package them into clean micro-prototypes.

To see these pieces in action, they are built to be compiled and executed directly through the [GameLauncher](https://github.com/morphingcoffee/GameLauncher/releases) utility, using a quick exit handshake to drop back to the main menu selection.


## 📊 Active Katas & Prototypes

| # | Prototype | Engine | Technical Focus | Status |
| :--- | :--- | :--- | :--- | :--- |
| **01** | [`evening_news`](incubator/01_evening_news/01_evening_news.md) | Godot 4.x | Audio Server DSP, pre-set state validation, Blender pipeline | 🚧 In Incubator |


## 🏛️ Workspace Architecture

To keep engines and raw assets from stepping on each other's toes, the repo uses a strict top-level layout:

* **`/incubator`** — The idea lab. Where the technical requirements and scope boundaries get written down before touching a line of code.
* **`/godot`** — Sandboxes for GDScript 2.0 experiments and component-driven node setups.
* **`/unity`** — Sandboxes for C# paradigms, low-overhead architectures, and ScriptableObject data structures.
* **`/art_source`** — Engine-agnostic storage for raw Blender models, master `.wav` files, and project stems. Keeps heavy source assets out of the engine compilation loops.


## ⚡ How to Clone Partially (Sparse Checkouts)

As this repo grows, a standard `git clone` will download a ton of heavy binary assets and music stems you might not need at that moment. If you just want to grab a single prototype folder without pulling down gigabytes of unrelated history, use this partial clone sequence:

### 1. Grab the Metadata Only
Download the commit history and folder structures, but **zero** actual file contents:
```bash
git clone --filter=blob:none --no-checkout [https://github.com/morphingcoffee/git-gud.git](https://github.com/morphingcoffee/git-gud.git)
cd git-gud
```


### 2. Set the Filter
Tell Git exactly which folders you want to make visible on your local machine (e.g., pulling the incubator directory and a specific kata folder):

```bash
git sparse-checkout set incubator/ godot/<kata-folder-name>
```

### 3. Pull the Trigger
Download only the specific files that match the folders you selected:

```bash
git checkout
```

_The rest of the repository stays completely virtualized, taking up 0 bytes on your drive._

<br>

---

## ⚖️ License
This repository is licensed under the Apache License 2.0.

Do whatever you want with the code—copy it, fork it, or rip out subsystems for your own projects. If you end up using something cool from here in a public release, leaving a tiny nod as outlined in the NOTICE file is appreciated.