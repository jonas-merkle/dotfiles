#!/bin/bash

# Define the directory of the current script
SCRIPT_DIR=$(dirname "$(realpath "$0")")

# Run setup scripts for Git, SSH, and Zsh

# Execute the Git setup script
echo "Setting up Git configuration..."
if [ -x "$SCRIPT_DIR/git/setup_git.sh" ]; then
  "$SCRIPT_DIR/git/setup_git.sh" || {
    echo "Error: Git setup failed."
    exit 1
  }
else
  echo "Error: $SCRIPT_DIR/git/setup_git.sh not found or not executable."
  exit 1
fi

# Execute the SSH setup script
echo "Setting up SSH configuration..."
if [ -x "$SCRIPT_DIR/ssh/setup_ssh.sh" ]; then
  "$SCRIPT_DIR/ssh/setup_ssh.sh" || {
    echo "Error: SSH setup failed."
    exit 1
  }
else
  echo "Error: $SCRIPT_DIR/ssh/setup_ssh.sh not found or not executable."
  exit 1
fi

# Execute the Zsh setup script
echo "Setting up Zsh configuration..."
if [ -x "$SCRIPT_DIR/zsh/setup_zsh.sh" ]; then
  "$SCRIPT_DIR/zsh/setup_zsh.sh" || {
    echo "Error: Zsh setup failed."
    exit 1
  }
else
  echo "Error: $SCRIPT_DIR/zsh/setup_zsh.sh not found or not executable."
  exit 1
fi

echo "All setups completed successfully!"
