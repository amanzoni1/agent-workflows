## Agent Workflow Policy

Classify the task before starting.

- **Surgical**: small, local, obvious scope, no meaningful behavior change. Implement directly with the smallest safe diff.
- **Debug**: unclear root cause, failing test, flaky behavior, regression, state/concurrency/queue/API/database issue. Use `systematic-debugging`.
- **Plan**: multi-file feature, behavior/API/database/worker/security change, or meaningful refactor. Use `implementation-planning` before coding.
- **Research**: ML/data/performance/benchmark/model change, or any claim that one approach is better than another. Use `research-validation`.
- **Review**: large, risky, or cross-cutting diff, or before claiming completion on non-trivial work. Use `completion-review`.
- **Onboarding**: new repo, missing/stale `AGENTS.md`, or a README/plan that should become agent instructions. Use `project-onboarding`.
- **Continuity**: handoff, context refresh, project status update, or significant completed/paused work. Use `project-continuity`.

If personal skills are unavailable, apply the same workflow inline.

If `docs/current_status.md` exists, read it before non-trivial work. Keep volatile project state there, not in `AGENTS.md`. Update it after meaningful completed, paused, or redirected work.

Do not ask clarifying questions that are answerable from repo context. Inspect first. Ask only when the answer materially changes implementation.

Before finishing, report:
- what changed
- tests/checks run
- what was not verified
