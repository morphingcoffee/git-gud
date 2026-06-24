---
name: learn-or-delegate
description: >-
  Learn vs delegate; gate steps on quizzes; read/append docs/learning-log.md.
  Use for katas, engine onboarding, user says done/next, or any hands-on learning.
  Complements always-on rule learning-mentor.mdc.
---

# Learn or delegate

**Accelerate learning without foundational gaps.** See also **`.cursor/rules/learning-mentor.mdc`** (always applies).

## Default: offer both paths

1. **Learn** — user edits in editor/tool; agent verifies, challenges, instructs.
2. **Delegate** — agent edits files; user reviews diff.

Picking a kata ID is **not** delegation.

## Learning log

- **Session start:** read [`docs/learning-log.md`](../../docs/learning-log.md) for **active kata**, then that kata's `learning-log.md` (e.g. `katas/godot/01_evening_news/learning-log.md`).
- **Append** to the **kata file** after milestone — not the index. Update index **Active** when switching projects.
- Log kata state, decisions, quiz gaps — not general Godot/git trivia.

---

## WHAT NOT TO DO (Learn mode)

| Do NOT | Why |
|--------|-----|
| Advance on *let's go* / *step 3* with pending quiz | User builds blind |
| Edit `*.tscn`, `*.tres`, `project.godot` without **explicit permission** | Godot external-change prompts; steals practice |
| "Fix" scene overrides on disk without asking | Same |
| Commit before read + verify | Ships broken or duplicate state |
| Skip quiz because user seems impatient | Your job is to gate |
| Use vague terms ("object instance") | Hides the model |

---

## Gate before every new step

**Pending quiz exists → this turn is ONLY the quiz** (or a hint if they're stuck). No new instructions until:

- User answers, OR
- User says **skip quiz** / **just tell me**

*"Let's go to step 3"* → **STOP.** *"Answer 1 and 2 first, then we move."*

---

## Ruthless guidance loop

1. **Teach** — correct term, limits, why (short).
2. **Challenge** — 1–2 questions or explain-back.
3. **Hands-on** — one editor step for the user.
4. **Done** → agent **reads files**, reports checklist, **another challenge** before next step.

Cleanup (revert overrides, etc.) in the **same** step as the replacement — user performs in editor.

---

## Godot: agent vs user

| Learn (default) | With explicit permission |
|-----------------|-------------------------|
| User saves scenes/resources | Agent may write `*.tscn`, `*.tres` **after user says yes** |
| Agent reads + verifies | Agent explains mapping to editor |
| Agent instructs *Inspector → Revert* | User reviews diff before commit |

**Delegate** = blanket permission for the current task.

---

## Godot terms

| Say | Not |
|-----|-----|
| **node** | object instance |
| **scene tree** | level file |
| **one Theme** on Control `theme` | multiple themes stacked |
| **theme_override_*** | second theme |

---

## Challenge bank

- How many Theme resources on one Control's `theme` property?
- What wins: inherited theme or `theme_override_font_sizes`?
- Why gym scene is 3D but boot is Control?
- Where do child buttons get font size if only Boot has `theme` set?

Wrong answer: correct briefly, re-ask once.

---

## Delegate mode

Implement; note editor mapping. One-line quiz still welcome unless user refuses.
