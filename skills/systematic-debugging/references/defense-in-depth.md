# Defense-in-Depth Validation

Use this reference when one validation check is too fragile: dangerous operations, security-sensitive paths, filesystem/process/database mutations, external side effects, or invalid state that can arrive through multiple entry points.

## Principle

Add checks at the layers where they buy real safety. Do not add duplicate validation everywhere by default. Prefer a small number of high-value guards that fail early, fail clearly, and prevent dangerous side effects.

## Useful Layers

### Entry Boundary

Reject invalid user input, command arguments, API payloads, config, environment variables, or job messages before they enter core logic.

### Domain Boundary

Assert invariants that must be true for a domain operation, even if an earlier layer should already have checked them.

### Dangerous Operation Boundary

Guard operations that mutate durable state, spawn processes, write files, charge money, send messages, delete data, or call external systems.

### Observability Boundary

Log enough context to debug failures that still get through, without leaking secrets or adding noisy permanent diagnostics.

## Decision Rule

When you find a bug:

1. Trace where the bad state originates and where it becomes dangerous.
2. Add the source fix first.
3. Add one downstream guard if bypassing the source check would cause expensive, unsafe, or confusing damage.
4. Add a regression test for the source fix, and a guard test when the guard protects a meaningful boundary.
5. Avoid checks that only restate type information or make normal code harder to change.
