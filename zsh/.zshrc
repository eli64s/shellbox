# -- .zshrc: Sets the environment for interactive shells.

# -- Oh My Zsh ------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="mgutz"

# -- Plugins --------------------------------------------------
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

# -- Functions ------------------------------------------------
# Add a directory to PATH if not already included
add_to_path() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        export PATH="$PATH:$1"
    fi
}

# Automatically activate Poetry environment
auto_poetry_shell() {
    if [ -f "pyproject.toml" ]; then
        poetry shell
    fi
}

# -- Zsh Configuration ----------------------------------------
# Git completion and aliases
fpath=($HOME/.zfunc $fpath)
autoload -Uz compinit
compinit

# -- Source Oh My Zsh -----------------------------------------
source "$ZSH/oh-my-zsh.sh"

# -- Path Modifications ---------------------------------------
export PATH="/opt/homebrew/bin:$PATH"

add_to_path "$HOME/bin"
add_to_path "/usr/local/bin"
add_to_path "/usr/local/lib/docker"
add_to_path "/Applications/Docker.app/Contents/Resources/bin/docker-credential-desktop"
add_to_path "$HOME/.local/bin"
add_to_path "/opt/homebrew/bin/poetry"
add_to_path "/usr/share/code"

# Rust/Cargo setup
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# Google Cloud SDK paths
GCloud_SDK_PATH="$HOME/Downloads/google-cloud-sdk"

if [ -f "$GCloud_SDK_PATH/path.zsh.inc" ]; then
    source "$GCloud_SDK_PATH/path.zsh.inc"
fi

if [ -f "$GCloud_SDK_PATH/completion.zsh.inc" ]; then
    source "$GCloud_SDK_PATH/completion.zsh.inc"
fi

# -- Hooks and Autoloads --------------------------------------
autoload -U add-zsh-hook
add-zsh-hook chpwd auto_poetry_shell

# -- Directory Navigation Settings ----------------------------
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

# -- History Settings -----------------------------------------
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

# -- GitHub/Dots Repository Integration ----------------------
DOTS_DIR="$HOME/Documents/GitHub/dots"
DOTS_SCRIPTS="$DOTS_DIR/scripts"

# Function to load scripts from directory
load_scripts() {
    local dir="$1"
    if [ -d "$dir" ]; then
        # Load and create functions for scripts
        for script in "$dir"/*.sh; do
            if [ -x "$script" ]; then
                local func_name=$(basename "$script" .sh)
                eval "function $func_name() { '$script' \"\$@\" }"
            fi
        done
    fi
}

# Load all script directories from DOTS_SCRIPTS
for category in "$DOTS_SCRIPTS"/*; do
    if [ -d "$category" ]; then
        load_scripts "$category"
    fi
done

# -- FZF Settings and Keybindings ----------------------------
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"

# Enable fzf keybindings and completion
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"

# Bind keys for fzf widgets
bindkey '^R' fzf-history-widget     # Ctrl+R
bindkey '^T' fzf-file-widget        # Ctrl+T
bindkey '^[c' fzf-cd-widget         # Alt+C

# -- 'uv' Autocomplete ----------------------------------------
eval "$(uv generate-shell-completion zsh)"

_uv_run_mod() {
    if [[ "$words[2]" == "run" && "$words[CURRENT]" != -* ]]; then
        _arguments '*:filename:_files'
    else
        _uv "$@"
    fi
}
compdef _uv_run_mod uv
