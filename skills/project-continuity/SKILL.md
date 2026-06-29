---
name: project-continuity
description: "Maintain docs/current_status.md as a precise handoff snapshot for current objectives, completed work, decisions, commands, blockers, and next steps."
---

# Project Continuity

Use this skill to keep project state recoverable across agents, chats, and time.

## Core Rule

Write the status file so a new agent can resume without rereading the whole conversation.

Keep durable instructions in `AGENTS.md`. Keep live status in `docs/current_status.md`.

## When Updating Is Required

Update or create `docs/current_status.md` when:

- the user asks for status, handoff, memory, recap, or project state
- meaningful work was completed, paused, redirected, or abandoned
- a decision changes the roadmap or operating model
- a source, experiment, branch, deploy, migration, or bug investigation reaches a useful result
- the next agent would otherwise repeat context gathering or redo a dead end

For tiny local edits, a status update is optional unless the file already tracks that exact workstream.

## Workflow

### 1. Gather Evidence

Inspect current repo state and relevant files:

- `AGENTS.md`, `README.md`, and existing `docs/current_status.md`
- recent diffs, branch name, and git status
- relevant docs, tests, logs, command outputs, generated files, data paths, or issue notes
- user request and the latest actual outcome

Do not invent completed work. Distinguish confirmed facts from assumptions.

### 2. Update The Snapshot

Use `references/current-status-template.md` for structure.

The file should answer:

- What is this project doing?
- What is the current objective?
- What has been completed recently?
- What decisions matter?
- What commands/checks were run?
- What is blocked, risky, or intentionally paused?
- What should happen next?
- What should not be repeated?

Keep it precise and concise. Prefer exact file paths, command names, branch names, data locations, and dates over vague prose.

### 3. Preserve Useful Negative Results

Record dead ends when they will save future time:

- failed source/provider/API attempts
- weak model or benchmark results
- abandoned branches or approaches
- flaky or unsafe operations
- known non-issues that were already checked

### 4. Avoid Noise

Do not turn the status file into a chat transcript or changelog. Remove stale details when they no longer help a new agent resume.

### 5. Verify

Before finishing:

- Re-read the status file as if you were a new agent.
- Confirm that next steps are concrete.
- Confirm that unresolved risks are explicit.
- Report whether the status file was updated and anything not verified.
