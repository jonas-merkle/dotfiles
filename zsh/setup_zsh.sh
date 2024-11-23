#!/bin/bash

# Define the directory of the current script
SCRIPT_DIR=$(dirname "$0")

# Source the utility functions
source "$SCRIPT_DIR/../scripts/utils.sh"

# Define source and target paths
ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH/custom}" # Default ZSH_CUSTOM to $ZSH/custom if not set
ALIASES_SRC="$SCRIPT_DIR/aliases.zsh"
ALIASES_TARGET="$ZSH_CUSTOM/aliases.zsh"

ZSHENV_SRC="$SCRIPT_DIR/zshenv"
ZSHENV_TARGET="$HOME/.zshenv"

P10K_SRC="$SCRIPT_DIR/p10k.zsh"
P10K_TARGET="$HOME/.p10k.zsh"

ZSHRC_SRC="$SCRIPT_DIR/zshrc"
ZSHRC_TARGET="$HOME/.zshrc"

# Ensure the ZSH_CUSTOM directory exists
if [ ! -d "$ZSH_CUSTOM" ]; then
  echo "Creating directory $ZSH_CUSTOM"
  mkdir -p "$ZSH_CUSTOM" || {
    echo "Error: Failed to create directory $ZSH_CUSTOM"
    exit 1
  }
fi

# Link aliases.zsh
if [ -e "$ALIASES_SRC" ]; then
  create_backup "$ALIASES_TARGET"
  create_symlink "$ALIASES_SRC" "$ALIASES_TARGET"
else
  echo "Error: Source file $ALIASES_SRC does not exist."
  exit 1
fi

# Link zshenv
if [ -e "$ZSHENV_SRC" ]; then
  create_backup "$ZSHENV_TARGET"
  create_symlink "$ZSHENV_SRC" "$ZSHENV_TARGET"
else
  echo "Error: Source file $ZSHENV_SRC does not exist."
  exit 1
fi

# Link p10k.zsh
if [ -e "$P10K_SRC" ]; then
  create_backup "$P10K_TARGET"
  create_symlink "$P10K_SRC" "$P10K_TARGET"
else
  echo "Error: Source file $P10K_SRC does not exist."
  exit 1
fi

# Link zshrc
if [ -e "$ZSHRC_SRC" ]; then
  create_backup "$ZSHRC_TARGET"
  create_symlink "$ZSHRC_SRC" "$ZSHRC_TARGET"
else
  echo "Error: Source file $ZSHRC_SRC does not exist."
  exit 1
fi

echo "Zsh configuration setup completed successfully!"
