---
name: completion-review
description: "Final review before claiming non-trivial coding work is complete, especially for large, risky, cross-cutting, user-facing, data, security, or ops changes."
---

# Completion Review

Use this skill to catch unfinished work before reporting completion.

## Core Rule

Review the actual diff and verification evidence, not just the intended plan.

Completion means the requested behavior is implemented, checked, and explainable. It does not mean every possible test passed, but unverified areas must be explicit.

## Workflow

### 1. Re-read the Request

- Confirm the latest user request, not an older assumption.
- Identify all promised behavior, constraints, and "do not" instructions.
- Check whether the implementation covers docs, config, install, migration, or ops work implied by the change.

### 2. Inspect the Diff

Review changed files for:

- accidental unrelated edits
- incomplete TODOs or generated placeholders
- stale comments or docs
- dead code, debug logging, print statements, temp files, or unused imports
- changed public contracts without corresponding callers/tests/docs
- data/schema changes without migration or rebuild instructions
- error paths and edge cases introduced by the change

### 3. Check Behavior Coverage

Ask:

- Does the new behavior work on the intended path?
- Does the old behavior still work where compatibility matters?
- Are failure modes handled clearly?
- Are user-visible messages, logs, or errors accurate?
- Are there hidden operational requirements the user needs to know?

### 4. Verify Appropriately

Run checks proportional to risk:

- original failing command or reproduction for bugs
- focused tests around changed behavior
- type/lint/build checks when relevant
- smoke checks for CLI, UI, worker, or install behavior
- snapshot/render/manual checks when visual or document output matters

If a check is too expensive, unavailable, or intentionally skipped, say that plainly.

### 5. Decide Completion

Before final response, decide:

- complete: behavior implemented and sufficiently verified
- complete with caveat: useful work done, explicit residual risk remains
- blocked: cannot finish without missing input, broken environment, or external dependency
- not complete: continue working

Do not present blocked or unverified work as finished.

## Completion Report

Final response should include:

- what changed
- tests/checks run
- what was not verified, if anything
- any follow-up that is genuinely useful
