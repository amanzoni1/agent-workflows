# Current Status Template

Use this structure for `docs/current_status.md`. Omit sections that do not apply, but keep enough detail for a new agent to resume.

```md
# Current Status

Last updated: YYYY-MM-DD

## Project Snapshot

One short paragraph describing what the project is and the current operating model.

## Current Objective

The active goal or workstream. Include whether it is in progress, paused, blocked, or complete.

## Recent Completed Work

- Concrete completed change or investigation result.
- Include important files, commands, data paths, or outputs when useful.

## Important Decisions

- Durable decision and why it matters.
- Include abandoned or paused directions when future agents might otherwise retry them.

## Commands And Verification

- `command`: result or reason it matters.
- Note any expensive checks intentionally not run.

## Known Issues And Risks

- Blocker, risk, missing input, flaky behavior, external dependency, or unverified area.

## Next Steps

1. Concrete next action.
2. Concrete follow-up.
3. Optional later work.

## Do Not Repeat

- Dead ends, already-checked hypotheses, unsafe commands, or stale assumptions.
```
