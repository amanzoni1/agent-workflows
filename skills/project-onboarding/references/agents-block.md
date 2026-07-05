<!-- agent-workflow-policy v3 -->
## Agent Workflow Policy

Classify the task before starting.

- **Surgical**: small, local, obvious scope, no meaningful behavior change. Implement directly with the smallest safe diff.
- **Debug**: unclear root cause, failing test, flaky behavior, regression, state/concurrency/queue/API/database issue. Use `systematic-debugging` (evidence before fixes).
- **Plan**: multi-file feature, behavior/API/database/worker/security change, or meaningful refactor. Use `implementation-planning` before coding (verification decided before editing).
- **Research**: ML/data/performance/benchmark/model change, or any claim that one approach is better than another. Use `research-validation` (baseline and predeclared metric before claims).
- **Review**: large, risky, or cross-cutting diff, or before claiming completion on non-trivial work. Use `completion-review` (read the actual diff; name what was not verified).
- **Onboarding**: new repo, missing/stale `AGENTS.md`, or a README/plan that should become agent instructions. Use `project-onboarding` (instructions from repo evidence).
- **Continuity**: handoff, context refresh, project status update, or significant completed/paused work. Use `project-continuity` (status a new agent can resume from).

Categories compose; re-classify as the task evolves. When several apply: plan first, debug when blocked, review before claiming done, then update continuity.

If personal skills are unavailable, apply each category's parenthetical rule inline.

If `docs/current_status.md` exists, read it before non-trivial work. Keep volatile project state there, not in `AGENTS.md`. Update it after meaningful completed, paused, or redirected work. Keep canonical docs current when changes affect reusable architecture, commands, data contracts, runbooks, or decisions. Prefer canonical docs under `docs/` unless the repo already has a clear established location.

Do not ask clarifying questions that are answerable from repo context. Inspect first. Ask only when the answer materially changes implementation.

Do not create commits, tags, or pushes on your own. When git history should be saved, propose the exact split and commit messages, then wait for explicit user confirmation before running `git commit` or `git push`.

Before finishing, report:

- what changed
- tests/checks run
- docs updated, or why no docs update was needed
- what was not verified
- state: complete, complete with caveat, or blocked
