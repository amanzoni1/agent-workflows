---
name: implementation-planning
description: "Lightweight planning before non-trivial coding work: multi-file features, behavior/API/database/security changes, migrations, refactors, or unclear implementation paths."
---

# Implementation Planning

Use this skill to choose a coherent implementation path before editing code.

## Core Rule

Inspect first, then plan. Do not invent architecture from the request alone when repo context can answer it.

Keep the plan proportional. A small multi-file change may need five bullets. A migration or cross-cutting change needs stronger sequencing, tests, and rollback thinking.

## Workflow

### 1. Define the Change

- Restate the desired behavior or outcome.
- Identify the user-visible, API-visible, data-visible, or operational contract being changed.
- Separate required work from nice-to-have cleanup.
- Note assumptions only when they affect the implementation.

### 2. Inspect the Existing System

- Read the relevant files, tests, commands, docs, schemas, and configuration.
- Identify established local patterns before adding new abstractions.
- Find ownership boundaries: modules, services, packages, jobs, database layers, generated files, and public interfaces.
- Check for existing helpers that already solve part of the problem.

### 3. Choose the Smallest Coherent Path

- Prefer changes that fit the current architecture.
- Avoid broad rewrites unless the existing shape prevents the requested behavior.
- Preserve compatibility unless the user explicitly asked for a breaking change.
- Plan data migrations, backfills, feature flags, or rollout steps when needed.

### 4. Plan Verification

Before editing, know how the change will be checked:

- narrow unit or integration tests for changed behavior
- regression coverage for the bug or edge case, if applicable
- type/lint/build checks relevant to touched code
- manual smoke path for UI, CLI, worker, or operational behavior

Do not use heavy checks when a narrow check gives enough confidence, unless the change is shared or risky.

### 5. Implement in Order

Use this default order unless repo context suggests otherwise:

1. Tests or fixtures that define the expected behavior, when practical.
2. Core implementation.
3. Integration wiring.
4. Docs/config/ops updates that are part of the behavior.
5. Verification and cleanup.

Keep unrelated refactors out of the diff.

## Plan Output

When the plan is useful to show, keep it short and concrete:

- intended behavior
- files or layers likely to change
- implementation sequence
- verification commands/checks
- notable risks or assumptions

Then execute the plan unless the user asked only for planning.
