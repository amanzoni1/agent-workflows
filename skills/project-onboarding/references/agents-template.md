# AGENTS.md Structure

Use this structure when creating or refreshing a project's `AGENTS.md`. Omit sections that do not apply.

The workflow policy block is not duplicated here. Insert the current contents of `references/agents-block.md`, including its `agent-workflow-policy` version marker line.

```md
# Agent Instructions

<insert the Agent Workflow Policy block from references/agents-block.md, keeping its version marker>

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
