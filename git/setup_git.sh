#!/bin/bash

# Define the directory of the current script
SCRIPT_DIR=$(dirname "$0")

# Source the utility functions
source "$SCRIPT_DIR/../scripts/utils.sh"

# Define source and target paths
GITCONFIG_SRC="$SCRIPT_DIR/gitconfig"
GITCONFIG_TARGET="$HOME/.gitconfig"
GITGLOBALS_SRC="$SCRIPT_DIR/git_globals"
GITGLOBALS_TARGET="$HOME/.config/git_globals"
CONFIG_DIR="$HOME/.config"

# Link .gitconfig
if [ -e "$GITCONFIG_SRC" ]; then
  create_backup "$GITCONFIG_TARGET"
  create_symlink "$GITCONFIG_SRC" "$GITCONFIG_TARGET"
else
  echo "Error: Source file $GITCONFIG_SRC does not exist."
  exit 1
fi

# Ensure .config directory exists
if [ ! -d "$CONFIG_DIR" ]; then
  echo "Creating directory $CONFIG_DIR"
  mkdir -p "$CONFIG_DIR" || {
    echo "Error: Failed to create directory $CONFIG_DIR"
    exit 1
  }
fi

# Link git_globals
if [ -e "$GITGLOBALS_SRC" ]; then
  create_backup "$GITGLOBALS_TARGET"
  create_symlink "$GITGLOBALS_SRC" "$GITGLOBALS_TARGET"
else
  echo "Error: Source directory $GITGLOBALS_SRC does not exist."
  exit 1
fi

echo "Git configuration setup completed successfully!"
