#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS=(
  systematic-debugging
  implementation-planning
  research-validation
  completion-review
  project-onboarding
  project-continuity
)
TARGETS=(
  "$HOME/.codex/skills"
  "$HOME/.claude/skills"
  "$HOME/.pi/agent/skills"
)

# AGENTS.block.md is the single source of truth for the workflow policy;
# refresh the copy that ships inside project-onboarding before installing.
cp "$ROOT/AGENTS.block.md" "$ROOT/skills/project-onboarding/references/agents-block.md"

copy_skill() {
  local source="$1"
  local target="$2"

  rm -rf "$target"
  mkdir -p "$(dirname "$target")"
  cp -R "$source" "$target"
}

for skill in "${SKILLS[@]}"; do
  if [ ! -d "$ROOT/skills/$skill" ]; then
    echo "Skipping missing skill: $skill"
    continue
  fi

  for target in "${TARGETS[@]}"; do
    copy_skill "$ROOT/skills/$skill" "$target/$skill"
  done

  echo "Installed $skill"
done

echo "Done."
