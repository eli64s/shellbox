# Oh My ZSH settings

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="mgutz"

plugins=(
  dotenv
  git
  poetry
  docker
  pyenv
  pip
  fzf
  vscode
  # zsh-autosuggestions
  zsh-syntax-highlighting
)

# -- Aliases ----------------------------------------------------
alias gs="git status"
alias gc="git commit"
alias gp="git push"
alias gpl="git pull"
alias gd="git diff"
alias ga="git add"
alias gco="git checkout"
alias gl="git log --oneline --graph --decorate"
alias grm="git rm -r --cached ."

# -- Functions ----------------------------------------------------
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

# -- Custom Function Paths ---------------------------------------------------
fpath+=("$HOME/.zfunc")

# -- Source oh-my-zsh --------------------------------------------------------
source "$ZSH/oh-my-zsh.sh"

# -- Shell Completion Settings -----------------------------------------------
zstyle ':completion:*' menu select

# -- Path Modifications ------------------------------------------------------
# Prepend /opt/homebrew/bin to PATH
export PATH="/opt/homebrew/bin:$PATH"

add_to_path "$HOME/bin"
add_to_path "/usr/local/bin"
add_to_path "/usr/local/lib/docker"
add_to_path "/Applications/Docker.app/Contents/Resources/bin/docker-credential-desktop"
add_to_path "$HOME/.local/bin"
add_to_path "/opt/homebrew/bin/poetry"
add_to_path "/usr/share/code"

# Rust/Cargo setup (must come early as other tools might depend on it)
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# Google Cloud SDK paths
GCloud_SDK_PATH="$HOME/Downloads/google-cloud-sdk"

if [ -f "$GCloud_SDK_PATH/path.zsh.inc" ]; then
  source "$GCloud_SDK_PATH/path.zsh.inc"
fi

if [ -f "$GCloud_SDK_PATH/completion.zsh.inc" ]; then
  source "$GCloud_SDK_PATH/completion.zsh.inc"
fi

# -- Hooks and Autoloads -----------------------------------------------------
autoload -U add-zsh-hook
add-zsh-hook chpwd auto_poetry_shell

# -- Directory Navigation Settings -------------------------------------------
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

# -- History Settings --------------------------------------------------------
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

# -- FZF Settings and Keybindings --------------------------------------------
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"

# Enable fzf keybindings and completion
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"

# Bind keys for fzf widgets
bindkey '^R' fzf-history-widget     # Ctrl+R
bindkey '^T' fzf-file-widget        # Ctrl+T
bindkey '^[c' fzf-cd-widget         # Alt+C

# -- 'uv' Autocomplete -------------------------------------------------------
eval "$(uv generate-shell-completion zsh)"

_uv_run_mod() {
  if [[ "$words[2]" == "run" && "$words[CURRENT]" != -* ]]; then
    _arguments '*:filename:_files'
  else
    _uv "$@"
  fi
}
compdef _uv_run_mod uv
