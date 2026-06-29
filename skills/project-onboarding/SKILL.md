---
name: project-onboarding
description: "Create or update project AGENTS.md/CLAUDE.md instructions from README, docs, source layout, commands, plans, and repo conventions."
---

# Project Onboarding

Use this skill to turn a project description and repository evidence into stable agent instructions.

## Core Rule

Generate instructions from the repo, not from assumptions. Read before writing.

`AGENTS.md` is for durable project policy: purpose, architecture, commands, boundaries, workflow routing, and stable conventions. Do not put volatile task status there; use `docs/current_status.md` for that.

## Workflow

### 1. Inspect Project Evidence

Read the relevant available sources:

- `README.md`, project brief, roadmap, or user-provided plan
- existing `AGENTS.md`, `CLAUDE.md`, `.cursorrules`, or similar agent files
- package/build files such as `package.json`, `pyproject.toml`, `Makefile`, `justfile`, `Cargo.toml`, `go.mod`, Docker files, CI config
- source layout, test layout, docs, scripts, env examples, migrations, data/ops folders

Use `rg --files` and inspect representative files. Do not scan generated/vendor/build artifacts unless they matter.

### 2. Identify Stable Facts

Extract only durable project guidance:

- project purpose and operating model
- key commands for setup, test, lint, build, run, deploy, or data jobs
- architecture and important directories
- coding conventions and local patterns
- external services, env vars, secrets handling, data locations, or safety constraints
- verification expectations
- docs/status files agents should read first

If a fact is uncertain, either verify it or phrase it as an instruction to inspect the relevant file.

### 3. Create or Update `AGENTS.md`

Use `references/agents-template.md` as the structure.

Rules:

- Put the reusable workflow policy near the top.
- Add project-specific sections below it.
- Keep the file concise enough that agents will actually read it.
- Preserve valuable existing project-specific instructions.
- Remove stale or contradictory guidance only when repo evidence supports the change.
- Do not include long explanations of why agent workflows exist.

### 4. Add Claude Wrapper When Useful

For Claude Code projects, create or update `CLAUDE.md` with a tiny wrapper that references `AGENTS.md`.

Do not duplicate all instructions into `CLAUDE.md` unless the harness cannot load `AGENTS.md`.

### 5. Verify

Before finishing:

- Re-read the generated `AGENTS.md` for accuracy and stale claims.
- Check that commands listed are plausible from repo files.
- Ensure volatile status points to `docs/current_status.md` instead of living in `AGENTS.md`.
- Report what files were created or updated and what was not verified.
