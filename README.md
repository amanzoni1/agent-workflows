# Agent Workflows Skillpack

Private workflow skills for coding agents.

The goal is a lightweight operating layer, not a methodology framework. `AGENTS.block.md` provides a portable router. The skills provide deeper workflow contracts only when a task needs them. Superpowers is useful source material, but this repo keeps the runtime lean for modern coding agents.

## Skills

- `systematic-debugging`: evidence-first debugging for unclear failures, regressions, flakiness, state issues, external-service failures, and performance/build failures.
- `implementation-planning`: short implementation plans for non-trivial features, behavior changes, migrations, refactors, or multi-file edits.
- `research-validation`: hypothesis, baseline, metric, and measurement discipline for ML, data, performance, benchmark, and evaluation work.
- `completion-review`: final review pass for risky, large, or cross-cutting changes before claiming completion.
- `project-onboarding`: create or update project-level `AGENTS.md` from README, docs, source layout, commands, and plans.
- `project-continuity`: maintain `docs/current_status.md` and canonical docs as precise continuity records for future agents.

## Design Rules

- Keep small obvious edits surgical.
- Prefer precise trigger descriptions over prompt prefixes.
- Keep `SKILL.md` files short enough to load cheaply.
- Put optional deeper techniques in `references/`, loaded only when relevant.
- Do not require TDD, subagents, or elaborate ceremony by default.
- Require evidence before claiming root cause, improvement, or completion.

## Repository Layout

```txt
agent-workflows/
├── AGENTS.block.md
├── install.sh
└── skills/
    ├── systematic-debugging/
    ├── implementation-planning/
    ├── research-validation/
    ├── completion-review/
    ├── project-onboarding/
    └── project-continuity/
```

## Install

Run:

```bash
./install.sh
```

The installer links skills into Codex-compatible discovery folders and copies skills into Claude Code's personal skill folder because Claude discovery may not follow symlinked directories.

## Project Usage

Paste `AGENTS.block.md` into a project's `AGENTS.md`, then add project-specific commands, architecture notes, and boundaries below it.

For Claude Code projects, add a tiny `CLAUDE.md`:

```md
@AGENTS.md

Use the personal skills when AGENTS.md classifies the task as debugging, planning, research validation, completion review, onboarding, or continuity work.
```

Keep stable instructions in `AGENTS.md`. Keep live handoff state in `docs/current_status.md`. Prefer durable project docs under `docs/` unless a repo already has a clear established location.
