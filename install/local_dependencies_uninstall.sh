#!/bin/bash

start_time=$SECONDS

log() {
  echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1"
}

error_exit() {
  echo "Error: $1"
  exit 1
}

log "Starting local environment cleanup for $USER@$(hostname)..."

# Remove pyenv
if command -v pyenv &> /dev/null; then
  log "Uninstalling pyenv..."
  rm -rf "$(pyenv root)" || error_exit "Failed to remove pyenv"
else
  log "pyenv is not installed."
fi

# Remove goenv
if command -v goenv &> /dev/null; then
  log "Uninstalling goenv..."
  rm -rf "$(goenv root)" || error_exit "Failed to remove goenv"
else
  log "goenv is not installed."
fi

# Uninstall Node.js
if command -v node &> /dev/null; then
  log "Uninstalling Node.js..."
  brew uninstall node || error_exit "Failed to uninstall Node.js"
else
  log "Node.js is not installed."
fi

# Remove Poetry
if command -v poetry &> /dev/null; then
  log "Uninstalling Poetry..."
  pip uninstall poetry -y || error_exit "Failed to uninstall Poetry"
else
  log "Poetry is not installed."
fi

# Remove Git
if command -v git &> /dev/null; then
  log "Uninstalling Git..."
  brew uninstall git || error_exit "Failed to uninstall Git"
else
  log "Git is not installed."
fi

# Remove Git LFS
if command -v git-lfs &> /dev/null; then
  log "Uninstalling Git LFS..."
  brew uninstall git-lfs || error_exit "Failed to uninstall Git LFS"
else
  log "Git LFS is not installed."
fi

# Remove kubectl
if command -v kubectl &> /dev/null; then
  log "Uninstalling kubectl..."
  brew uninstall kubectl || error_exit "Failed to uninstall kubectl"
else
  log "kubectl is not installed."
fi

# Remove kubectx
if command -v kubectx &> /dev/null; then
  log "Uninstalling kubectx..."
  brew uninstall kubectx || error_exit "Failed to uninstall kubectx"
else
  log "kubectx is not installed."
fi

# Remove Helm
if command -v helm &> /dev/null; then
  log "Uninstalling Helm..."
  brew uninstall helm || error_exit "Failed to uninstall Helm"
else
  log "Helm is not installed."
fi

# Clean up any remaining configuration files
log "Cleaning up remaining configuration files..."
rm -f ~/.npmrc
rm -f ~/.zshrc
rm -rf ~/.local/bin

end_time=$SECONDS
elapsed_time=$((end_time - start_time))
minutes=$((elapsed_time / 60))
seconds=$((elapsed_time % 60))

log "Total cleanup time: $minutes minutes $seconds seconds"
log "Local environment successfully cleaned for $USER@$(hostname)! Ready for a fresh start!"
