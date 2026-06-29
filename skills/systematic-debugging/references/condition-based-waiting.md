# Condition-Based Waiting

Use this reference when debugging flaky async tests, arbitrary sleeps, polling, retries, race conditions, or timeouts.

## Principle

Wait for the condition that proves the system reached the desired state. Do not guess with fixed sleeps unless the behavior under test is itself time-based.

## Pattern

```typescript
await new Promise(r => setTimeout(r, 50));
const result = getResult();
expect(result).toBeDefined();
```

```typescript
const result = await waitFor(
  () => getResult(),
  'result to be available',
);
expect(result).toBeDefined();
```

## Implementation

```typescript
async function waitFor<T>(
  condition: () => T | undefined | null | false,
  description: string,
  timeoutMs = 5000,
): Promise<T> {
  const startTime = Date.now();

  while (true) {
    const result = condition();
    if (result) return result;

    if (Date.now() - startTime > timeoutMs) {
      throw new Error(`Timeout waiting for ${description} after ${timeoutMs}ms`);
    }

    await new Promise(r => setTimeout(r, 10));
  }
}
```

## Good Conditions

- Event observed: `events.find(event => event.type === 'DONE')`
- State reached: `machine.state === 'ready'`
- Count reached: `items.length >= expected`
- File exists: `fs.existsSync(path)`
- External result available: `response.status === 'complete'`

## Fixed Sleeps

Fixed sleeps are acceptable only when all of these are true:

1. The behavior under test is explicitly time-based, such as debounce, throttle, TTL, timeout, retry interval, or scheduler tick.
2. The sleep duration is derived from the configured timing, not guessed.
3. The test first waits for the triggering condition when possible.
4. A short comment explains why a time wait is required.

## Common Mistakes

- Polling too fast and wasting CPU.
- Omitting a timeout, causing hanging tests.
- Reading stale state outside the polling loop.
- Waiting for an implementation detail instead of the externally visible condition.
