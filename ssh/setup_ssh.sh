#!/bin/bash

# Define the directory of the current script
SCRIPT_DIR=$(dirname realpath "$0")

# Source the utility functions
source "$SCRIPT_DIR/../scripts/utils.sh"

# Define source and target paths
SSH_CONFIG_SRC="$SCRIPT_DIR/config"
SSH_CONFIG_DIR="$HOME/.ssh"
SSH_CONFIG_TARGET="$SSH_CONFIG_DIR/config"

# Ensure the .ssh directory exists
if [ ! -d "$SSH_CONFIG_DIR" ]; then
  echo "Creating directory $SSH_CONFIG_DIR"
  mkdir -p "$SSH_CONFIG_DIR" || {
    echo "Error: Failed to create directory $SSH_CONFIG_DIR"
    exit 1
  }
fi

# Link the SSH config file
if [ -e "$SSH_CONFIG_SRC" ]; then
  create_backup "$SSH_CONFIG_TARGET"
  create_symlink "$SSH_CONFIG_SRC" "$SSH_CONFIG_TARGET"
else
  echo "Error: Source file $SSH_CONFIG_SRC does not exist."
  exit 1
fi

echo "SSH configuration setup completed successfully!"
