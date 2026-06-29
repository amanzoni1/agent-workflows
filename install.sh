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
mkdir -p "$HOME/.agents/skills"
mkdir -p "$HOME/.claude/skills"

link_skill() {
  local source="$1"
  local target="$2"

  if [ -e "$target" ] && [ ! -L "$target" ]; then
    rm -rf "$target"
  fi

  ln -sfn "$source" "$target"
}

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

  link_skill "$ROOT/skills/$skill" "$HOME/.codex/skills/$skill"
  link_skill "$ROOT/skills/$skill" "$HOME/.agents/skills/$skill"
  copy_skill "$ROOT/skills/$skill" "$HOME/.claude/skills/$skill"

  echo "Installed $skill"
done

echo "Done."
