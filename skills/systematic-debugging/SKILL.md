---
name: systematic-debugging
description: "Evidence-first debugging that finds the root cause before changing code. Use when a failure is unclear, flaky, a regression, or involves state/API/database/build/performance issues."
---

# Systematic Debugging

Use this skill to find and fix root causes, not symptoms.

## Gate

**Do not change code until you can state a root-cause hypothesis backed by observed evidence.**

If the error output alone already proves the root cause, skip to step 6 — but still verify with the original reproduction.

Keep the workflow proportional. For a narrow failure, this may be a short trace and one confirming command. For flaky, stateful, external-service, or performance failures, be more rigorous.

## Workflow

### 1. Understand the Failure

Inspect the actual failure before proposing fixes.

- Read the full error, stack trace, failing assertion, log, or observed behavior.
- Identify what was expected versus what happened.
- Note affected files, commands, inputs, timestamps, or environment details.
- Check whether the failure is deterministic or flaky.

If the issue cannot be reproduced, gather more evidence instead of guessing.

### 2. Reproduce or Isolate

Prefer the smallest reproduction available.

- Run the narrowest failing test or command.
- If no test exists, identify the smallest manual or scripted reproduction.
- For flaky issues, look for timing, ordering, caching, concurrency, or external-service factors.
- For queue/worker issues, inspect job state, retry behavior, idempotency, and side effects.
- For database/state issues, inspect persisted state before and after the failure.

### 3. Trace the Boundary

Find where reality first diverges from expectation.

Check boundaries in this order when relevant:

1. Input/request/event/job payload
2. Validation/parsing
3. Business logic
4. Database/state mutation
5. External API/model/service call
6. Queue/task retry or async handoff
7. Response/output/side effect

Add temporary logging or assertions only when they directly test a hypothesis. Remove temporary diagnostics before finishing unless they are intentionally useful observability.

Optional deeper techniques:

- Read `references/root-cause-tracing.md` when the error appears far from the original trigger, invalid data travels through several layers, or a stack trace is not enough.
- Read `references/condition-based-waiting.md` when debugging flaky async tests, sleeps, polling, retries, race conditions, or timeouts.
- Read `references/defense-in-depth.md` when the root cause is unsafe invalid state crossing trust boundaries, dangerous filesystem/process/database effects, security-sensitive behavior, or repeated bypasses of a single validation point.

### 4. Form One Hypothesis

State the most likely root cause in one sentence.

Good hypothesis:

- names the failing component
- explains why the observed behavior happens
- predicts what evidence should confirm or reject it

Avoid changing multiple unrelated things at once.

### 5. Test the Hypothesis

Run the smallest check that can confirm or reject the hypothesis.

- If confirmed, implement the smallest root-cause fix.
- If rejected, record what was learned and form a new hypothesis.
- Do not keep patching symptoms.

### 6. Fix and Verify

Implement the minimal safe fix.

Then verify with:

- the original failing command/test/reproduction
- a regression test; if you skip one, say so and why
- nearby tests for affected behavior
- lint/type checks only when relevant to the changed code

For behavior changes, prefer adding or updating a test.

## Completion Report

Before finishing, report:

- root cause found
- fix made
- tests/checks run
- anything not verified
- remaining risk, only if meaningful
