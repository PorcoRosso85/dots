#!/bin/zsh

# Set immediate exit if any command fails
set -e

# Define the dotfiles directory, git executable, zshrc path, and remote repository URL
DOTS=".dots"
DOTS_DIR="$HOME/$DOTS"
GIT_EXECUTABLE="/usr/bin/git"
ZSHRC_PATH="$HOME/.zshrc"
REMOTE_REPO_URL="https://github.com/PorcoRosso85/dots.git"

rollback() {
  echo "An error occurred! Rolling back changes..."
  rm -rf "$DOTS_DIR"
  sed -i '/alias dots/d' "$ZSHRC_PATH"
}

dots_alias() {
  $GIT_EXECUTABLE --git-dir=$DOTS_DIR --work-tree=$HOME "$@"
}

# Function to set up the dotfiles repository and push changes
push_dots() {
  # Common setup code
  if [[ -d "$DOTS_DIR" ]]; then
    echo "$DOTS directory already exists. Skipping setup."
    return 1
  fi

  trap rollback ERR

  echo "Setting up $DOTS directory..."
  $GIT_EXECUTABLE init --bare "$DOTS_DIR"
  echo "alias dots='dots_alias'" >> "$ZSHRC_PATH"
  dots_alias config --local status.showUntrackedFiles no
  echo "$DOTS directory has been set up."
  echo "Please restart your terminal or run 'source $ZSHRC_PATH' to use the 'dots' alias."

  # Add, commit and push files
  dots_alias add .vimrc
  dots_alias commit -m "Add vimrc"
  dots_alias add .zshrc
  dots_alias commit -m "Add zshrc"
  dots_alias remote add origin "$REMOTE_REPO_URL"
  dots_alias push -u origin master

  trap - ERR
}

# Function to clone an existing dotfiles repository
pull_dots() {
  # Common clone code
  if [[ -d "$DOTS_DIR" ]]; then
    echo "$DOTS directory already exists. Please remove it before cloning a new one."
    return 1
  fi

  trap rollback ERR

  echo "Cloning $DOTS directory..."
  $GIT_EXECUTABLE clone --bare "$REMOTE_REPO_URL" "$DOTS_DIR"
  echo "$DOTS" >> "$HOME/.gitignore"

  # Check for potential conflicts before checkout
  BACKUP_DIR="$HOME/dots_backup_$(date +%Y%m%d%H%M%S)"
  mkdir -p "$BACKUP_DIR"
  dots_alias fetch
  CONFLICTS=$(dots_alias checkout 2>&1 | grep "existing file" | awk '{print $1}')
  for conflict in $CONFLICTS; do
    mv "$HOME/$conflict" "$BACKUP_DIR/"
  done

  # Attempt to checkout again
  dots_alias checkout

  # If you want to restore files from the backup directory after successful checkout, you can do so here.

  echo "source $ZSHRC_PATH" >> "$ZSHRC_PATH"
  source "$ZSHRC_PATH"
  echo "$DOTS directory has been cloned and set up."

  trap - ERR
}

# Main script
main() {
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
