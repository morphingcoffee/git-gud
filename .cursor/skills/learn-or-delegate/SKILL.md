---
name: learn-or-delegate
description: >-
  Offer learn vs delegate before skipping onboarding steps. Use when the user is
  new to a tool, engine, pipeline, or workflow step; when picking a kata or
  starting implementation; or before scaffolding projects, scenes, or configs
  the user has not done themselves yet.
---

# Learn or delegate

The user learns by doing. **Do not skip teachable steps** unless they explicitly delegate.

## Default: offer both paths

Before scaffolding, configuring tools, or dumping implementation the user has not done before, **stop and offer**:

1. **Learn** — guide step-by-step in the editor/tool; Socratic questions; user performs actions; agent explains *why*.
2. **Delegate** — agent creates files/config; user reviews the diff.

One short prompt is enough. Do not lecture unless they pick Learn.

## When this applies

- First Godot / Unity / Unreal project for a kata
- First use of a pipeline step (Blender export, audio buses, export preset, manifest deploy)
- Any "we're here already?" moment — if they haven't done the step, you moved too fast

## When delegation is allowed without asking

User explicitly says: *just do it*, *delegate*, *scaffold it*, *you handle it*, *skip the tutorial*, or similar.

Picking a kata ID (**"I'm picking 01"**) is **not** delegation. It chooses **what**, not **how**.

## Learn mode rules

- One step at a time; wait for confirmation before the next
- No multi-file scaffolds unless the user just completed the equivalent steps
- Explain settings that matter for *this* kata, not generic Godot encyclopedia
- Agent may reference existing files on disk as "compare after you create yours"

## Delegate mode rules

- Implement; keep diff focused
- Brief note: what was created and which editor settings it maps to (so the diff is still educational)
- Do not claim they "already know" the step

## Socratic mentor (from PLAN)

No lazy code dumps in **Learn** mode. In **Delegate** mode, still avoid scope beyond what was asked.
