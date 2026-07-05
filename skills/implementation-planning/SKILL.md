---
name: implementation-planning
description: "Plan non-trivial coding work before editing. Use for multi-file features, behavior/API/database/security changes, migrations, refactors, or unclear implementation paths."
---

# Implementation Planning

Use this skill to choose a coherent implementation path before editing code.

If the harness has a native plan mode, use it for the mechanics; this skill defines what the plan must contain.

## Gate

**Before editing, know what the change is, how it fits the existing system, and how it will be verified.**

Keep the plan proportional. A small multi-file change may need five bullets. A migration or cross-cutting change needs stronger sequencing, tests, and rollback thinking.

## Workflow

### 1. Define the Change

- Restate the desired behavior and the contract being changed: user-visible, API, data, or operational.
- Separate required work from nice-to-have cleanup.
- Note assumptions only when they affect the implementation.

### 2. Inspect the Existing System

- Read the relevant files, tests, commands, docs, schemas, and configuration.
- Follow established local patterns before adding new abstractions; check for existing helpers that already solve part of the problem.
- Note ownership boundaries: modules, services, jobs, generated files, and public interfaces.

### 3. Choose the Smallest Coherent Path

- Prefer changes that fit the current architecture; avoid broad rewrites unless the existing shape prevents the requested behavior.
- Preserve compatibility unless the user explicitly asked for a breaking change.
- Plan data migrations, backfills, feature flags, or rollout steps when needed.

### 4. Decide Verification Before Editing

This is the step most worth doing well. Before touching code, know which checks will prove the change:

- narrow unit or integration tests for changed behavior
- regression coverage for the bug or edge case, if applicable
- type/lint/build checks relevant to touched code
- manual smoke path for UI, CLI, worker, or operational behavior

Prefer the narrowest check that gives enough confidence; escalate for shared or risky changes.

### 5. Implement in Order

Default order unless repo context suggests otherwise: tests or fixtures that define expected behavior when practical, core implementation, integration wiring, docs/config/ops updates that are part of the behavior, then verification and cleanup.

Keep unrelated refactors out of the diff.

## Plan Output

When the plan is useful to show, keep it short and concrete:

- intended behavior
- files or layers likely to change
- implementation sequence
- verification commands/checks
- notable risks or assumptions

Then execute the plan unless the user asked only for planning.
