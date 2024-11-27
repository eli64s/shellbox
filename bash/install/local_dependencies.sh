#!/usr/bin/env bash

start_time=$SECONDS

log() {
  echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1"
}

error_exit() {
  echo "Error: $1"
  exit 1
}

log "Starting local environment setup for $USER@$(hostname)..."

# Switch to zsh shell for Oh My Zsh installation and configuration
if [ "$SHELL" != "/bin/zsh" ]; then
  log "Switching to zsh shell..."
  chsh -s /bin/zsh || error_exit "Failed to switch shell to zsh"
  export SHELL=/bin/zsh
  exec /bin/zsh
fi

# Backup existing .zshrc
if [ -f "$HOME/.zshrc" ]; then
  cp "$HOME/.zshrc" "$HOME/.zshrc.bak"
  log "Backup of .zshrc created at ~/.zshrc.bak"
fi

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  log "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || error_exit "Failed to install Oh My Zsh"
else
  log "Oh My Zsh is already installed."
fi

# Install Homebrew
if ! command -v brew &> /dev/null; then
  log "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || error_exit "Failed to install Homebrew"
else
  log "Homebrew is already installed."
fi

# Install pyenv
if ! command -v pyenv &> /dev/null; then
  log "Installing pyenv..."
  brew install pyenv || error_exit "Failed to install pyenv"
else
  log "pyenv is already installed."
fi

# Update .zshrc for pyenv
if ! grep -q 'eval "$(pyenv init -)"' ~/.zshrc; then
  echo 'eval "$(pyenv init -)"' >> ~/.zshrc
  log "pyenv initialization added to .zshrc."
else
  log "pyenv initialization is already in .zshrc."
fi
source ~/.zshrc

# Install xz
if ! brew list | grep -q "xz"; then
  log "Installing xz..."
  brew install xz || error_exit "Failed to install xz"
else
  log "xz is already installed."
fi

# Install Python 3.11.0
log "Installing Python 3.11.0..."
CFLAGS="-I$(brew --prefix xz)/include" LDFLAGS="-L$(brew --prefix xz)/lib" pyenv install 3.11.0 || error_exit "Failed to install Python 3.11.0"

log "Setting Python 3.11.0 as the global version..."
pyenv global 3.11.0 || error_exit "Failed to set Python 3.11.0 as the global version"

log "Verifying Python installation..."
python --version || error_exit "Python installation verification failed"

# Install goenv
if ! command -v goenv &> /dev/null; then
  log "Installing goenv..."
  brew install goenv || error_exit "Failed to install goenv"
else
  log "goenv is already installed."
fi

# Update .zshrc for goenv
if ! grep -q 'eval "$(goenv init -)"' ~/.zshrc; then
  echo 'eval "$(goenv init -)"' >> ~/.zshrc
  log "goenv initialization added to .zshrc."
else
  log "goenv initialization is already in .zshrc."
fi
source ~/.zshrc

# Install Go 1.21.7
log "Installing Go 1.21.7..."
goenv install 1.21.7 || error_exit "Failed to install Go 1.21.7"

log "Setting Go 1.21.7 as the global version..."
goenv global 1.21.7 || error_exit "Failed to set Go 1.21.7 as the global version"

# Update .zshrc for Go path
if ! grep -q 'export PATH="$HOME/go/bin:$PATH"' ~/.zshrc; then
  echo 'export PATH="$HOME/go/bin:$PATH"' >> ~/.zshrc
  log "Go path added to .zshrc."
else
  log "Go path is already in .zshrc."
fi
source ~/.zshrc

log "Setting up Go proxy configuration..."
go env -w GOPRIVATE="*.enterprise.com" || error_exit "Failed to set GOPRIVATE"
go env -w GOPROXY="https://enterprise" || error_exit "Failed to set GOPROXY"

log "Verifying Go installation..."
go version || error_exit "Go installation verification failed"

# Install kubectl
log "Installing kubectl..."
brew install kubectl || error_exit "Failed to install kubectl"

# Update .zshrc for kubectl alias
if ! grep -q 'alias k="kubectl"' ~/.zshrc; then
  echo 'alias k="kubectl"' >> ~/.zshrc
  log "kubectl alias added to .zshrc."
else
  log "kubectl alias 'k' is already set in .zshrc."
fi
source ~/.zshrc

# Install kubectx
log "Installing kubectx..."
brew install kubectx || error_exit "Failed to install kubectx"

# Install Helm
log "Installing Helm..."
brew install helm || error_exit "Failed to install Helm"

# Install Node.js
log "Installing Node.js..."
brew install node || error_exit "Failed to install Node.js"

log "Updating npmrc with enterprise registry..."
echo "registry=https://enterprise" > ~/.npmrc || error_exit "Failed to update npmrc"

log "Verifying Node.js and npm installation..."
node --version || error_exit "Node.js installation verification failed"
npm --version || error_exit "npm installation verification failed"

# Install Poetry
if ! command -v poetry &> /dev/null; then
  log "Installing Poetry..."
  curl -sSL https://install.python-poetry.org | python3 - || error_exit "Failed to install Poetry"
else
  log "Poetry is already installed."
fi

# Update .zshrc for Poetry path
if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' ~/.zshrc; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
  log "Poetry path added to .zshrc."
else
  log "Poetry path is already in .zshrc."
fi
source ~/.zshrc

log "Verifying Poetry installation..."
poetry --version || error_exit "Poetry installation verification failed"

# Install Git
if ! command -v git &> /dev/null; then
  log "Installing Git..."
  brew install git || error_exit "Failed to install Git"
else
  log "Git is already installed."
fi

# Install Git LFS
log "Installing Git LFS..."
brew install git-lfs || error_exit "Failed to install Git LFS"
git lfs install || error_exit "Failed to configure Git LFS"

log "Verifying Git and Git LFS installation..."
git --version || error_exit "Git installation verification failed"
git lfs --version || error_exit "Git LFS installation verification failed"

end_time=$SECONDS
elapsed_time=$((end_time - start_time))
minutes=$((elapsed_time / 60))
seconds=$((elapsed_time % 60))

log "Total installation time: $minutes minutes $seconds seconds"
log "Local dependencies successfully installed for $USER@$(hostname)! Happy building!"
