---
name: github-gh-cli
description: >-
  Read GitHub repository content exclusively via the gh CLI — never via
  WebFetch, WebSearch, or browser URLs. Use when inspecting GitHub repos,
  issues, PRs, releases, file trees, READMEs, or any github.com / raw.githubusercontent.com
  content; or when gh fails and you need the correct recovery steps.
---

# GitHub via gh CLI Only

## Hard rule

**Never use `WebFetch` or `WebSearch` to read GitHub content** when `gh` can do the job. This includes:

- `https://github.com/...` (repo pages, README, tree views)
- `https://raw.githubusercontent.com/...`
- `https://api.github.com/...`

Use the **Shell tool** with `gh` instead.

### Allowed exceptions

- User explicitly asks to open a URL in the browser (use MCP `open_resource`, not WebFetch).
- The repo is already cloned locally — read files with Read/Grep/Glob on disk first.
- `gh` is confirmed missing **and** auth cannot be established after recovery (report the blocker; do not silently fall back to web fetch).

## Before concluding gh is broken

Run diagnostics **without** redirecting stderr (`2>/dev/null`):

```bash
which gh && gh --version
gh auth status
```

Common false failures:

| Symptom | Likely cause |
|---------|----------------|
| Exit 1, empty output, stderr hidden | Invalid `--json` field (e.g. `readme` is not valid for `gh repo view`) |
| Exit 1, "Could not resolve host" | Network/sandbox — retry with `full_network` |
| Exit 4, not logged in | Run `gh auth login` or tell user to authenticate |

## Command reference

### Repo overview

```bash
gh repo view OWNER/REPO
gh repo view OWNER/REPO --json name,description,url,defaultBranchRef,languages,primaryLanguage
```

### List root directory

```bash
gh api repos/OWNER/REPO/contents/ --jq '.[].name'
```

### Read a file (raw)

```bash
gh api repos/OWNER/REPO/contents/PATH -H "Accept: application/vnd.github.raw"
```

### Read a file (JSON + jq)

```bash
gh api repos/OWNER/REPO/contents/PATH --jq '.content' | base64 -d
```

### Issues & PRs

```bash
gh issue list --repo OWNER/REPO
gh issue view NUMBER --repo OWNER/REPO
gh pr list --repo OWNER/REPO
gh pr view NUMBER --repo OWNER/REPO
gh pr diff NUMBER --repo OWNER/REPO
```

### Releases

```bash
gh release list --repo OWNER/REPO
gh release view TAG --repo OWNER/REPO
```

### Clone (when local copy needed)

```bash
gh repo clone OWNER/REPO /path/to/dir
```

## Workflow

1. **Local first** — if the repo is in the workspace, use Read/Grep; do not re-fetch from GitHub.
2. **Remote read** — use `gh repo view` / `gh api` as above.
3. **On failure** — read stderr, fix the query (field names, repo path, permissions), retry once.
4. **Still blocked** — tell the user what failed and what you tried; do not substitute WebFetch.

## JSON field safety

When using `--json`, only request fields listed in the error's "Available fields" list. Invalid fields fail the entire command.

Valid `gh repo view --json` examples: `name`, `description`, `url`, `defaultBranchRef`, `languages`, `primaryLanguage`, `latestRelease`.

`readme` is **not** a valid field — use `gh repo view OWNER/REPO` (renders README) or fetch `README.md` via `gh api`.
