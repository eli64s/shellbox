# ~/.zprofile: Set environment variables and PATH for login shells.

# Homebrew: Ensure Homebrew's binaries are in PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Python Development Setup
export PYENV_ROOT="$HOME/.pyenv"
export POETRY_HOME="$HOME/.poetry"

# Add Homebrew, pyenv, and Poetry to PATH if their directories exist
if [[ -d "$PYENV_ROOT/bin" ]]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
fi

if [[ -d "$POETRY_HOME/bin" ]]; then
    export PATH="$POETRY_HOME/bin:$PATH"
fi

# Add Homebrew's bin directory to PATH
export PATH="/opt/homebrew/bin:$PATH"

# Local binaries: Add ~/.local/bin to PATH
export PATH="$PATH:$HOME/.local/bin"

# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Initialize pyenv for login shells
if command -v pyenv >/dev/null 2>&1; then
    eval "$(pyenv init --path)"
fi
