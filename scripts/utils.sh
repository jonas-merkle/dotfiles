#!/bin/bash

# Function to create a backup of a file or directory
create_backup() {
  local target=$1
  if [ -e "$target" ] || [ -L "$target" ]; then
    local timestamp=$(date +'%Y%m%d%H%M%S')
    local backup_target="${target}_backup_$timestamp"
    echo "Creating backup of $target at $backup_target"
    mv "$target" "$backup_target" || {
      echo "Error: Failed to create backup for $target"
      exit 1
    }
  fi
}

# Function to create a symbolic link
create_symlink() {
  local source=$1
  local target=$2
  echo "Creating symlink: $target -> $source"
  ln -s "$source" "$target" || {
    echo "Error: Failed to create symlink $target"
    exit 1
  }
}
