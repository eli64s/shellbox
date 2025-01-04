# .zshrc: Sets the environment for interactive shells.

# -- Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="mgutz"

# -- Plugins
plugins=(
    dotenv
    git
    poetry
    docker
    pyenv
    pip
    fzf
    vscode
    zsh-syntax-highlighting
)

# -- Functions
add_to_path() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        export PATH="$PATH:$1"
    fi
}

auto_poetry_shell() {
    if [ -f "pyproject.toml" ]; then
        poetry shell
    fi
}

# -- Zsh Configuration
fpath=($HOME/.zfunc $fpath)
autoload -Uz compinit
compinit

# -- Source Oh My Zsh
source "$ZSH/oh-my-zsh.sh"

# -- Path Modifications
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
add_to_path "$HOME/.local/bin"
add_to_path "$HOME/bin"
add_to_path "/usr/local/bin"
add_to_path "/usr/local/lib/docker"
add_to_path "/Applications/Docker.app/Contents/Resources/bin/docker-credential-desktop"
add_to_path "/opt/homebrew/bin/poetry"
add_to_path "/usr/share/code"

# Rust/Cargo setup
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# Google Cloud SDK paths
GCloud_SDK_PATH="$HOME/google-cloud-sdk"
if [ -f "$GCloud_SDK_PATH/path.zsh.inc" ]; then
    source "$GCloud_SDK_PATH/path.zsh.inc"
fi
if [ -f "$GCloud_SDK_PATH/completion.zsh.inc" ]; then
    source "$GCloud_SDK_PATH/completion.zsh.inc"
fi

# -- Hooks and Autoloads
autoload -U add-zsh-hook
add-zsh-hook chpwd auto_poetry_shell

# -- Directory Navigation Settings
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

# -- History Settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.zsh_history"
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

# -- GitHub/dots repository integration
# DOTS_DIR="$HOME/Projects/GitHub/dots"
# if [ -d "$DOTS_DIR/scripts" ]; then
#     for script in "$DOTS_DIR/scripts"/*.sh; do
#         if [ -f "$script" ] && [ -x "$script" ]; then
#             source "$script"
#         fi
#     done
# fi

# -- FZF Settings and Keybindings
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
bindkey '^R' fzf-history-widget
bindkey '^T' fzf-file-widget
bindkey '^[c' fzf-cd-widget

# -- uv autocomplete
if command -v uv &> /dev/null; then
    eval "$(uv generate-shell-completion zsh)"
fi
