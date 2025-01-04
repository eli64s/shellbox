# ~/.zprofile: Set environment variables and PATH for login shells.

# Homebrew: Ensure Homebrew's binaries are in PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Python Development Setup
export PYENV_ROOT="$HOME/.pyenv"
export POETRY_HOME="$HOME/.poetry"

# Add Homebrew, pyenv, and Poetry to PATH if their directories exist
path_append() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$PATH:$1"
    fi
}

path_append "/opt/homebrew/bin"
path_append "/opt/homebrew/sbin"
path_append "$HOME/.local/bin"
path_append "/usr/local/bin"
path_append "/usr/local/lib/docker"
path_append "/Applications/Docker.app/Contents/Resources/bin"
path_append "/opt/homebrew/bin/poetry"

# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Initialize pyenv for login shells
if command -v pyenv >/dev/null 2>&1; then
    eval "$(pyenv init --path)"
fi

# Initialize Poetry environment variables
if [ -f "$POETRY_HOME/env" ]; then
    source "$POETRY_HOME/env"
fi

# Export other environment variables if necessary
# Example:
# export NODE_ENV=production
