# vim: set ft=sh:

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# ZSH_THEME=cloud
ZSH_THEME=rooprob

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
	dotenv
	nvm
	npm
	zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export PYENV_ROOT="$HOME/.pyenv"
export RBENV_ROOT="$HOME/.rbenv"
export PATH="/opt/nvim-linux64/bin:$HOME/.cargo/bin:$PYENV_ROOT/bin:$RBENV_ROOT/bin:$PATH:/opt/geth:/opt/idea/bin"

# set PATH so it includes user's private bin if it exists
export PRIVATE_BIN=$HOME/.bin
if [ -d "$PRIVATE_BIN" ]; then
	PATH="$PRIVATE_BIN:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi
# fetchmail -s -d 60
#eval "$(pyenv init --path)"

eval "$(pyenv init -)" # this makes pyenv work in the shell
eval "$(pyenv virtualenv-init - zsh)"
source $PYENV_ROOT/completions/pyenv.bash

eval "$(rbenv init -)"

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/home/me/projects/gcp-functions/google-cloud-sdk/path.zsh.inc' ]; then . '/home/me/projects/gcp-functions/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/home/me/projects/gcp-functions/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/me/projects/gcp-functions/google-cloud-sdk/completion.zsh.inc'; fi

# source ~/.zplug/init.zsh
# zplug "avivl/gcloud-project", use:init.sh

export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH
export GOPATH=~/go
export EDITOR=nvim
alias vim=nvim

test -n "${terminfo[kcuu1]}" && bindkey "${terminfo[kcuu1]}" up-line-or-history
test -n "${terminfo[kcud1]}" && bindkey "${terminfo[kcud1]}" down-line-or-history

WORDCHARS='_-*'

unsetopt inc_append_history
unsetopt share_history

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

export SECOND_HOME=$HOME/second

source "$HOME"/.zsecond
