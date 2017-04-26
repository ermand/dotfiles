# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:~/.composer/vendor/bin:node_modules/.bin:/usr/local/sbin::/usr/local/Cellar/node/7.7.3/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/ermanddurro/.oh-my-zsh

# SET UTF-8 for everything
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

ZSH_THEME="avit"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew sublime grep zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Example aliases
alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source ~/.aliases
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
