# AGENTS.md Structure

Use this structure when creating or refreshing a project's `AGENTS.md`. Omit sections that do not apply.

```md
# Agent Instructions

## Agent Workflow Policy

Classify the task before starting.

- **Surgical**: small, local, obvious scope, no meaningful behavior change. Implement directly with the smallest safe diff.
- **Debug**: unclear root cause, failing test, flaky behavior, regression, state/concurrency/queue/API/database issue. Use `systematic-debugging`.
- **Plan**: multi-file feature, behavior/API/database/worker/security change, or meaningful refactor. Use `implementation-planning` before coding.
- **Research**: ML/data/performance/benchmark/model change, or any claim that one approach is better than another. Use `research-validation`.
- **Review**: large, risky, or cross-cutting diff, or before claiming completion on non-trivial work. Use `completion-review`.
- **Onboarding**: new repo, missing/stale `AGENTS.md`, or a README/plan that should become agent instructions. Use `project-onboarding`.
- **Continuity**: handoff, context refresh, project status update, or significant completed/paused work. Use `project-continuity`.

If personal skills are unavailable, apply the same workflow inline.

If `docs/current_status.md` exists, read it before non-trivial work. Keep volatile project state there, not in `AGENTS.md`. Update it after meaningful completed, paused, or redirected work. Keep canonical docs current when changes affect reusable architecture, commands, data contracts, runbooks, or decisions. Prefer canonical docs under `docs/` unless the repo already has a clear established location.

Do not ask clarifying questions that are answerable from repo context. Inspect first. Ask only when the answer materially changes implementation.

Before finishing, report:
- what changed
- tests/checks run
- what was not verified

## Project Purpose

Briefly state what this repo does and the main operating model.

## Key Commands

- Setup:
- Test:
- Lint/typecheck:
- Build:
- Run/dev:
- Deploy/ops:

## Architecture

Describe important directories, packages, services, data layers, jobs, or UI surfaces.

## Development Rules

Capture project-specific conventions, boundaries, generated files, migrations, secrets, data safety, and code ownership patterns.

## Documentation Ownership

Keep documentation precise and concise. Prefer canonical docs under `docs/` unless the repo already has a clear established location. Update them when changes affect reusable architecture, commands, data contracts, runbooks, decisions, or research notes. Keep `docs/current_status.md` as the resume anchor: outcome, decision, blocker, next step, and pointers to detailed docs.

Declare canonical docs for this repo:

- Project status / handoff: `docs/current_status.md`
- Architecture:
- Commands / operations:
- Data model / schemas:
- Source strategy / integrations:
- Roadmap / decisions:
- Research / experiments:

## Status And Handoff

Read `docs/current_status.md` before non-trivial work if it exists. Update it after meaningful completed, paused, or redirected work.
```
