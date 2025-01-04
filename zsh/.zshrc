# ~/.zshrc: Configure interactive Zsh shell.

# Oh-My-Zsh configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="mgutz"  # Set your preferred theme

# Oh-My-Zsh plugins
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
    # zsh-autosuggestions
)

# Source Oh-My-Zsh to enable its features and plugins
source $ZSH/oh-my-zsh.sh

# Initialize completion system
fpath=($HOME/.zfunc $fpath)
autoload -Uz compinit
compinit

# Initialize pyenv for interactive shells
if command -v pyenv >/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# Initialize uv (Assuming 'uv' is a valid command)
if command -v uv >/dev/null 2>&1; then
    eval "$(uv generate-shell-completion zsh)"
fi

# Initialize Poetry for interactive shells
auto_poetry_shell() {
    if [ -f "pyproject.toml" ]; then
        poetry shell
    fi
}

# Hooks and Autoloads
autoload -U add-zsh-hook
add-zsh-hook chpwd auto_poetry_shell

# Enable Colors in the Terminal
export CLICOLOR=1

# Define LS_COLORS for Enhanced Directory Listings
export LS_COLORS="di=01;34:ln=01;36:so=01;35:pi=40;33:ex=01;32:bd=40;33;01:cd=40;33;01:su=37;41:sg=30;43:tw=30;42:ow=34;43"

# Configure ZSH Syntax Highlighting with an Enhanced Color Palette
typeset -A ZSH_HIGHLIGHT_STYLES

# Command Elements in Bold Blue
ZSH_HIGHLIGHT_STYLES[command]='fg=blue,bold'

# Built-in Commands in Bright Cyan
ZSH_HIGHLIGHT_STYLES[builtin]='fg=cyan,bright'

# Reserved Words in Bold Magenta
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=magenta,bold'

# Paths and Navigation in Bright Green
ZSH_HIGHLIGHT_STYLES[path]='fg=green,bright'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=green,bright'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=green,bright'

# Arguments and Options in Bright Yellow
ZSH_HIGHLIGHT_STYLES[argument]='fg=yellow,bright'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=yellow,bright'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=yellow,bright'

# String Literals and Aliases in Bright Magenta
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bright'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=magenta,bright'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=magenta,bright'

# Additional Highlighting for Variables and Functions
ZSH_HIGHLIGHT_STYLES[variable]='fg=orange,bright'
ZSH_HIGHLIGHT_STYLES[function]='fg=blue,bright'

# Highlight Errors in Bold Red for Immediate Attention
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=red,bold'

# History Settings
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

# FZF configuration
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --preview 'cat {}'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Development Environment Integrations

# Rust
if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi

# Google Cloud SDK
GCLOUD_PATH="$HOME/google-cloud-sdk"
if [ -f "$GCLOUD_PATH/path.zsh.inc" ]; then
    source "$GCLOUD_PATH/path.zsh.inc"
fi
if [ -f "$GCLOUD_PATH/completion.zsh.inc" ]; then
    source "$GCLOUD_PATH/completion.zsh.inc"
fi

# Autosuggestions Configuration
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Source additional tools (must be at the end)
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Uncomment if you want to enable zsh-autosuggestions
# source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# GitHub/dots symlinked scripts
# DOTS_DIR="$HOME/Projects/GitHub/dots"
# if [ -d "$DOTS_DIR/scripts" ]; then
#     for script in "$DOTS_DIR/scripts"/*.sh; do
#         if [ -f "$script" ] && [ -x "$script" ]; then
#             source "$script"
#         fi
#     done
# fi

# Optional: Customize the Shell Prompt
# Uncomment and modify the following line to set a custom prompt
# PROMPT='%F{218}%1~ %F{99}$ %f'
