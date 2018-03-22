# Set CLICOLOR.
export CLICOLOR=1

# Path to your oh-my-zsh installation.
export ZSH=/Users/fabio/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="fabiosimple"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git common-aliases)

source $ZSH/oh-my-zsh.sh

# Some ZSH options

# Disable shared history
unsetopt share_history 

# Load rest of the shell stuff.

. ~/.shell/aliases
. ~/.shell/completions
. ~/.shell/functions
. ~/.shell/envvars

# iTerm2 integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Set the terminal badges
. ~/.shell/it2badges

