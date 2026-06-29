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

mkdir -p "$HOME/.codex/skills"
mkdir -p "$HOME/.claude/skills"

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

  copy_skill "$ROOT/skills/$skill" "$HOME/.codex/skills/$skill"
  copy_skill "$ROOT/skills/$skill" "$HOME/.claude/skills/$skill"
  rm -rf "$HOME/.agents/skills/$skill"

  echo "Installed $skill"
done

echo "Done."
