# Root Cause Tracing

Use this reference when a bug appears far from its original trigger: a stack trace points deep in a call chain, invalid state was accepted earlier, a worker fails on a bad payload, or a database/file/API operation receives a surprising value.

## Principle

Trace backward until you can explain where the bad state first entered the system. Fix that source, then add narrow guards only where they prevent real recurrence or improve diagnostics.

## Process

1. Start at the visible symptom: failing assertion, exception, wrong output, bad side effect, or suspicious metric.
2. Identify the immediate operation that produced the symptom.
3. Ask what input, state, or dependency result made that operation behave incorrectly.
4. Trace one caller, handler, query, job, or state transition upstream.
5. Repeat until you find the earliest point where invalid or unexpected state was created, accepted, or transformed.
6. Fix the source. Avoid fixing only the final symptom unless tracing hits a hard boundary.

## Temporary Instrumentation

Add diagnostics only when they test a specific hypothesis or reveal an upstream value. Prefer logging before the dangerous operation, not after it fails.

```typescript
async function runDangerousOperation(input: Input) {
  console.error('DEBUG before dangerous operation', {
    input,
    cwd: process.cwd(),
    stack: new Error().stack,
  });
  return dangerousOperation(input);
}
```

In tests, `console.error()` is often more reliable than project loggers because test runners may suppress log levels.

## Stop Criteria

- You can name the first component that produced or accepted the bad state.
- You can explain why the observed failure follows from that state.
- You have a targeted fix at or near that origin.
- You know whether additional guardrails are necessary or just noise.
