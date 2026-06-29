---
name: systematic-debugging
description: Use for technical issues where the root cause is unclear: failing tests, flaky behavior, regressions, production-like bugs, state/concurrency problems, queue/worker issues, database inconsistencies, external API failures, build failures, or performance regressions. Do not use for trivial, obvious single-line fixes where the cause is already known; handle those surgically and verify.
---

# Systematic Debugging

Use this skill to find and fix root causes, not symptoms.

## Core rule

Do not change code until you have enough evidence to explain the likely root cause.

Exception: if the cause is obvious and local, make the smallest surgical fix and verify it.

## Workflow

### 1. Understand the failure

Inspect the actual failure before proposing fixes.

- Read the full error, stack trace, failing assertion, log, or observed behavior.
- Identify what was expected versus what happened.
- Note affected files, commands, inputs, timestamps, or environment details.
- Check whether the failure is deterministic or flaky.

If the issue cannot be reproduced, gather more evidence instead of guessing.

### 2. Reproduce or isolate

Prefer the smallest reproduction available.

- Run the narrowest failing test or command.
- If no test exists, identify the smallest manual or scripted reproduction.
- For flaky issues, look for timing, ordering, caching, concurrency, or external-service factors.
- For queue/worker issues, inspect job state, retry behavior, idempotency, and side effects.
- For database/state issues, inspect persisted state before and after the failure.

### 3. Trace the boundary

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

### 4. Form one hypothesis

State the most likely root cause in one sentence.

Good hypothesis:

- names the failing component
- explains why the observed behavior happens
- predicts what evidence should confirm or reject it

Avoid changing multiple unrelated things at once.

### 5. Test the hypothesis

Run the smallest check that can confirm or reject the hypothesis.

- If confirmed, implement the smallest root-cause fix.
- If rejected, record what was learned and form a new hypothesis.
- Do not keep patching symptoms.

### 6. Fix and verify

Implement the minimal safe fix.

Then verify with:

- the original failing command/test/reproduction
- a regression test when practical
- nearby tests for affected behavior
- lint/type checks only when relevant to the changed code

For behavior changes, prefer adding or updating a test.

## Completion report

Before finishing, report:

- root cause found
- fix made
- tests/checks run
- anything not verified
- remaining risk, only if meaningful
