# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:~/.composer/vendor/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/ermand.durro/.oh-my-zsh

# SET UTF-8 for everything
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

ZSH_THEME="avit"

## Spaceship
# ZSH_THEME="spaceship"
# SPACESHIP_PACKAGE_SHOW="false"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew sublime grep zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Example aliases
alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# Powerleve9k theme
#POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs newline)

# Antigen
#source ~/antigen.zsh

# Load the oh-my-zsh's library.
#antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
#antigen bundle git
#antigen bundle heroku
#antigen bundle pip
#antigen bundle lein
#antigen bundle command-not-found

# Syntax highlighting bundle.
#antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
#antigen theme robbyrussell
#antigen theme bhilburn/powerlevel9k powerlevel9k

# Tell Antigen that you're done.
#antigen apply

source ~/.aliases
#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
