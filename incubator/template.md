# Prototype Name

### 🎯 The Hook
*What does the player actually do, and what is the presentation vibe?*
* **Core Loop:** [1-2 sentences on the exact second-to-second gameplay interaction]
* **Aesthetic/Vibe:** [Minimalist, low-poly, 2D vector, audio-only, etc.]

### 🎬 The Payoff
*Why is this fun or cool for a peer to open from your launcher? What is the explicit win condition or terminal "The End" state that lets them cleanly quit back to the launcher?*
* **The Hook-Execution:** [What makes this short experience satisfying or tense?]
* **The Exit State:** [How does the game end, and how does it clean up/hand control back?]

### 🛠️ The Tech Drill (Underlying Lessons)
*What specific engine subsystems, architectural patterns, mathematical concepts, or optimizations are we deliberately drilling inside this boundary?*
* **Engine Target:** [Godot 4.x / Unity / etc.]
* **Subsystem A:** [e.g., Audio Server routing, custom bus effect modulation]
* **Subsystem B:** [e.g., Run-time path-buffering via Vector2 arrays]
* **Subsystem C:** [e.g., Viewport/CanvasLayer rendering isolation]

### 🏋️ Gym (optional dev station)
*Per-kata mechanic lab — unpolished, isolated drills. Skip if the loop is inseparable.*

* **Gym verdict:** [yes / thin / skip]
* **Stations:** [List what each gym scene lets you try — map from Subsystems A/B/C]
* **Gym rules:** [What constraints are relaxed vs the level — e.g. visuals on, no timer]

### 🎮 Level (Phase 1 MVP)
*The composed experience that ships to GameLauncher.*

* **Level scope:** [Same as MVP Scope below — one coherent loop with real constraints]
* **Uses gym work:** [Which proven subsystems get composed here]

## 🚀 MVP Scope (Phase 1)
* **Core Focus:** [What 100% of initial velocity targets]
* **Static Presentation / constraints:** [Art and scope limits]
* **Single Matrix Loop:** [One scenario / one win condition]

### 🚧 Scope Gates
*What are we explicitly NOT building or learning here? This is your shield against feature creep.*
* **Gate 1:** [e.g., No physics-based collision resolution—use pure vector distance checks instead]
* **Gate 2:** [e.g., No multi-level progression systems—one single hardcoded scenario only]
* **Gate 3:** [e.g., No custom UI or main menus—game starts instantly on launch]

---

## 📡 Future Expansions (Backlog)
*Phase 2+ only — not gym, not Phase 1 level.*
