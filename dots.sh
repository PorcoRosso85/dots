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

handle_untracked_files() {
  # Detect untracked files that would be overwritten by checkout
  UNTRACKED=$(dots_alias checkout 2>&1 | grep "untracked working tree files would be overwritten by checkout:" -A1000 | tail -n +2)
  if [ ! -z "$UNTRACKED" ]; then
    echo "Detected untracked files. Moving untracked files to $BACKUP_DIR"
    for untracked_file in $UNTRACKED; do
      if [[ -f "$HOME/$untracked_file" ]]; then
        mv "$HOME/$untracked_file" "$BACKUP_DIR/"
      fi
    done
  fi
}

handle_conflicts() {
  # Before checkout, fetch and identify potential conflicts
  dots_alias fetch
  CONFLICTS=$(dots_alias checkout 2>&1 | grep "would be overwritten by checkout:" -A1000 | tail -n +2)
  if [ ! -z "$CONFLICTS" ]; then
    echo "Detected file conflicts. Moving conflicting files to $BACKUP_DIR"
    for conflict in $CONFLICTS; do
      if [[ -f "$HOME/$conflict" ]]; then
        mv "$HOME/$conflict" "$BACKUP_DIR/"
      fi
    done
  fi
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
  # If the .dots directory already exists, remove it
  if [[ -d "$DOTS_DIR" ]]; then
    echo "$DOTS directory already exists. Removing it..."
    rm -rf "$DOTS_DIR"
  fi

  trap rollback ERR

  echo "Cloning $DOTS directory..."
  $GIT_EXECUTABLE clone --bare "$REMOTE_REPO_URL" "$DOTS_DIR"
  echo "$DOTS" >> "$HOME/.gitignore"
  add_alias_to_rc

  BACKUP_DIR="$HOME/.dots_backup"
  mkdir -p "$BACKUP_DIR"
  
  # Handle conflicts
  handle_untracked_files
  handle_conflicts

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
