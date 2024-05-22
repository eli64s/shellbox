#!/bin/bash

start_time=$SECONDS

echo "Starting local environment setup for $USER@$(hostname)..."

# Install Oh My Zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh is already installed."
fi

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.bashrc
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "Homebrew is already installed."
fi

# Install pyenv if not already installed
if ! command -v pyenv &> /dev/null; then
  echo "Installing pyenv..."
  brew install pyenv
else
  echo "pyenv is already installed."
fi

# Add pyenv init to bashrc if not already present
if ! grep -q 'eval "$(pyenv init -)"' ~/.bashrc; then
  echo 'eval "$(pyenv init -)"' >> ~/.bashrc
fi

# Install xz if not already installed
if ! brew list | grep -q "xz"; then
  echo "Installing xz..."
  brew install xz
else
  echo "xz is already installed."
fi

# Install and set Python 3.11.0
echo "Installing Python 3.11.0..."
CFLAGS="-I$(brew --prefix xz)/include" LDFLAGS="-L$(brew --prefix xz)/lib" pyenv install 3.11.0

echo "Setting Python 3.11.0 as the global version..."
pyenv global 3.11.0

echo "Verifying Python installation..."
python --version

# Install goenv if not already installed
if ! command -v goenv &> /dev/null; then
  echo "Installing goenv..."
  brew install goenv
else
  echo "goenv is already installed."
fi

# Add goenv init to bashrc if not already present
if ! grep -q 'eval "$(goenv init -)"' ~/.bashrc; then
  echo 'eval "$(goenv init -)"' >> ~/.bashrc
fi

# Install and set Go 1.21.7
echo "Installing Go 1.21.7..."
goenv install 1.21.7

echo "Setting Go 1.21.7 as the global version..."
goenv global 1.21.7

# Add Go binary path to bashrc if not already present
if ! grep -q 'export PATH="$HOME/go/bin:$PATH"' ~/.bashrc; then
  echo 'export PATH="$HOME/go/bin:$PATH"' >> ~/.bashrc
fi

# Set up Go proxy configuration
echo "Setting up Go proxy configuration..."
go env -w GOPRIVATE="*.enterprise.com"
go env -w GOPROXY="https://enterprise"

echo "Verifying Go installation..."
go version

# Install kubectl
echo "Installing kubectl..."
brew install kubectl

# Add kubectl alias if not already present
if ! grep -q 'alias k="kubectl"' ~/.bashrc; then
  echo 'alias k="kubectl"' >> ~/.bashrc
fi

# Install kubectx
echo "Installing kubectx..."
brew install kubectx

# Install Helm
echo "Installing Helm..."
brew install helm

# Install Node.js
echo "Installing Node.js..."
brew install node

# Update npmrc with enterprise registry
echo "Updating npmrc with enterprise registry..."
echo "registry=https://enterprise" > ~/.npmrc

echo "Verifying Node.js and npm installation..."
node --version
npm --version

# Install Poetry if not already installed
if ! command -v poetry &> /dev/null; then
  echo "Installing Poetry..."
  curl -sSL https://install.python-poetry.org | python3 -
else
  echo "Poetry is already installed."
fi

# Add Poetry path to bashrc if not already present
if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' ~/.bashrc; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
fi

echo "Verifying Poetry installation..."
poetry --version

# Install Git if not already installed
if ! command -v git &> /dev/null; then
  echo "Installing Git..."
  brew install git
else
  echo "Git is already installed."
fi

# Install Git LFS
echo "Installing Git LFS..."
brew install git-lfs
git lfs install

echo "Verifying Git and Git LFS installation..."
git --version
git lfs --version

end_time=$SECONDS
elapsed_time=$((end_time - start_time))
minutes=$((elapsed_time / 60))
seconds=$((elapsed_time % 60))

echo "Total installation time: $minutes minutes $seconds seconds"
echo "Local dependencies successfully installed for $USER@$(hostname)! Happy building!"
