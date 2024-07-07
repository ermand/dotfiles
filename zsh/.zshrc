if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Set prompt to be oh-my-posh
# eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/catppuccin_mocha.omp.json)"
#
# if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
#   eval "$(oh-my-posh init zsh)"
# fi

# Set the prompt to starship
eval "$(starship init zsh)"

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias vim='nvim'
alias c='clear'
source ~/.aliases

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
# PATH
## dotfiles path
export DOTFILES="$(dirname "$(dirname "$(readlink "${(%):-%N}")")")"

## Path
export PATH="$HOME/.local/bin:/usr/local/opt/libpq/bin:$PATH"

## Poetry
export PATH="$HOME/.poetry/bin:$PATH"

## composer
export PATH=~/.composer/vendor/bin:$PATH

## nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## pnpm
export PNPM_HOME="/Users/ermanddurro/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

## GOPATH
export GOPATH=$(go env GOPATH)
export PATH="$PATH:$GOPATH/bin"

## Postgreql
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

## KAFKA
export LIBRARY_PATH="/opt/homebrew/Cellar/librdkafka/2.0.2/lib"
export PKG_CONFIG_PATH="/opt/homebrew/Cellar/openssl@3/3.1.0/lib/pkgconfig"


# Github
# export GITHUB_TOKEN="<GITHUB_TOKEN>"

# Kubeconfig
export KUBECONFIG=/Users/ermanddurro/.kube/config:/Users/ermanddurro/.kube/eksconfig

# ChatGPT
export OPENAI_API_KEY="<OPENAI_API_KEY>"

# Prompt current directory for the window
#precmd () {print -Pn "\e]0;%~\a"}

## Forge CLI
export FORGE_API_TOKEN="<FORGE_API_TOKEN>"

## herd
export PATH="/Users/ermanddurro/Library/Application Support/Herd/bin/":$PATH
## Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/ermanddurro/Library/Application Support/Herd/config/php/83/"

## Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/ermanddurro/Library/Application Support/Herd/config/php/82/"

PATH=~/.console-ninja/.bin:$PATH

#jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

export JAVA_HOME="/usr/libexec/java_home -v 1.8"

