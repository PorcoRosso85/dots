#!/bin/bash

# dotsリポジトリのローカルへの反映と、リモートへの更新を定義する

set -e

DOTS=".dots"
DOTS_DIR="$HOME/$DOTS"
GIT_EXECUTABLE="/usr/bin/git"
RC_PATH="$HOME/.bashrc"
REMOTE_REPO_URL="https://github.com/PorcoRosso85/dots.git"

rollback() {
  echo "An error occurred! Rolling back changes..."
  rm -rf "$DOTS_DIR"
  dots_alias config --unset alias.dots
}

dots_alias() {
  $GIT_EXECUTABLE --git-dir=$DOTS_DIR --work-tree=$HOME "$@"
}

add_alias_to_rc() {
  # Remove if alias exists using dots_alias config
  dots_alias config --unset alias.dots 2>/dev/null || true
  # Add the new alias
  dots_alias config alias.dots 'dots_alias'
  echo "alias dots='dots_alias'" >> "$RC_PATH"
}

push_dots() {
  if [[ -d "$DOTS_DIR" ]]; then
    echo "$DOTS directory already exists. Skipping setup."
    return 1
  fi

  trap rollback ERR

  echo "Setting up $DOTS directory..."
  $GIT_EXECUTABLE init --bare "$DOTS_DIR"
  add_alias_to_rc
  dots_alias config --local status.showUntrackedFiles no
  echo "$DOTS directory has been set up."
  echo "Please restart your terminal or run 'source $RC_PATH' to use the 'dots' alias."

  dots_alias add .vimrc
  dots_alias commit -m "Add vimrc"
  dots_alias add .bashrc
  dots_alias commit -m "Add bashrc"
  dots_alias remote add origin "$REMOTE_REPO_URL"
  # Fetch to determine the default branch
  dots_alias fetch
  DEFAULT_BRANCH=$(dots_alias branch -r | sed -n '/\* /s///p')
  dots_alias push -u origin "$DEFAULT_BRANCH"

  trap - ERR
}

pull_dots() {
  if [[ -d "$DOTS_DIR" ]]; then
    echo "$DOTS directory already exists. Please remove it before cloning a new one."
    return 1
  fi

  trap rollback ERR

  echo "Cloning $DOTS directory..."
  $GIT_EXECUTABLE clone --bare "$REMOTE_REPO_URL" "$DOTS_DIR"
  echo "$DOTS" >> "$HOME/.gitignore"
  add_alias_to_rc

  BACKUP_DIR="$HOME/dots_backup_$(date +%Y%m%d%H%M%S)"
  mkdir -p "$BACKUP_DIR"
  dots_alias fetch
  CONFLICTS=$(dots_alias checkout 2>&1 | grep "existing file" | awk '{print $1}')
  for conflict in $CONFLICTS; do
    mv "$HOME/$conflict" "$BACKUP_DIR/"
  done

  echo "If there were any file conflicts, the originals have been moved to: $BACKUP_DIR"

  dots_alias checkout
  echo "source $RC_PATH" >> "$RC_PATH"
  source "$RC_PATH"
  echo "$DOTS directory has been cloned and set up."

  trap - ERR
}

main() {
  echo "WARNING: Before running this script, ensure you trust its source."
  echo "Choose an action:"
  echo "1. Set up a new $DOTS directory (push_dots)"
  echo "2. Clone an existing $DOTS directory (pull_dots)"
  echo "Enter the number corresponding to your choice: "
  read choice

  case "$choice" in
    1)
      push_dots
      ;;
    2)
      pull_dots
      ;;
    *)
      echo "Invalid choice. Exiting..."
      ;;
  esac
}

main
