# -- .zprofile: set the environment for login shells.

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Python Development
export PYENV_ROOT="$HOME/.pyenv"
export POETRY_HOME="$HOME/.poetry"
[[ -d "$PYENV_ROOT/bin" ]] && export PATH="$PYENV_ROOT/bin:$PATH"
[[ -d "$POETRY_HOME/bin" ]] && export PATH="$POETRY_HOME/bin:$PATH"
eval "$(pyenv init --path)"

# Local binaries
export PATH="$PATH:$HOME/.local/bin"

# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Development directories
export PROJECTS_DIR="$HOME/Documents/GitHub"
export DOTS_DIR="$PROJECTS_DIR/dots"
