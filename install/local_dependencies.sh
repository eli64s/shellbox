#!/bin/zsh

start_time=$SECONDS

echo "Starting local environment setup for $USER@$(hostname)..."

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh is already installed."
fi

if ! command -v brew &> /dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed."
fi

if ! command -v pyenv &> /dev/null; then
  echo "Installing pyenv..."
  brew install pyenv
else
  echo "pyenv is already installed."
fi

echo 'eval "$(pyenv init -)"' >> ~/.zshrc
source ~/.zshrc

if ! brew list | grep -q "xz"; then
  echo "Installing xz..."
  brew install xz
else
  echo "xz is already installed."
fi

echo "Installing Python 3.11.0..."
CFLAGS="-I$(brew --prefix xz)/include" LDFLAGS="-L$(brew --prefix xz)/lib" pyenv install 3.11.0

echo "Setting Python 3.11.0 as the global version..."
pyenv global 3.11.0

echo "Verifying Python installation..."
python --version

if ! command -v goenv &> /dev/null; then
  echo "Installing goenv..."
  brew install goenv
else
  echo "goenv is already installed."
fi

echo 'eval "$(goenv init -)"' >> ~/.zshrc
source ~/.zshrc

echo "Installing Go 1.21.7..."
goenv install 1.21.7

echo "Setting Go 1.21.7 as the global version..."
goenv global 1.21.7

echo 'export PATH="$HOME/go/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

echo "Setting up Go proxy configuration..."
go env -w GOPRIVATE="*.enterprise.com"
go env -w GOPROXY="https://enterprise"

echo "Verifying Go installation..."
go version

echo "Installing kubectl..."
brew install kubectl

if ! grep -q 'alias k="kubectl"' ~/.zshrc; then
  echo 'alias k="kubectl"' >> ~/.zshrc
  source ~/.zshrc
else
  echo "kubectl alias 'k' is already set."
fi

echo "Installing kubectx..."
brew install kubectx

echo "Installing Helm..."
brew install helm

echo "Installing Node.js..."
brew install node

echo "Updating npmrc with enterprise registry..."
echo "registry=https://enterprise" > ~/.npmrc

echo "Verifying Node.js and npm installation..."
node --version
npm --version

if ! command -v poetry &> /dev/null; then
  echo "Installing Poetry..."
  curl -sSL https://install.python-poetry.org | python3 -
else
  echo "Poetry is already installed."
fi

if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' ~/.zshrc; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
  source ~/.zshrc
else
  echo "Poetry path is already in PATH."
fi

echo "Verifying Poetry installation..."
poetry --version

if ! command -v git &> /dev/null; then
  echo "Installing Git..."
  brew install git
else
  echo "Git is already installed."
fi

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
