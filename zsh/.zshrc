# vim: set ft=bash:
if [ "$enable_profile" = "1" ]; then
    zmodload zsh/zprof
fi
#
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=rooprob

plugins=(git
 	dotenv
 	nvm
 	# npm
 	zsh-syntax-highlighting)

zstyle ':omz:plugins:nvm' lazy yes
source $ZSH/oh-my-zsh.sh

export PYENV_ROOT="$HOME/.pyenv"
export RBENV_ROOT="$HOME/.rbenv"
export GOPATH=~/go
export PRIVATE_BIN=$HOME/.bin
export PATH="$PRIVATE_BIN:$HOME/.local/bin:$GOPATH/bin:/opt/nvim-linux64/bin:$HOME/.cargo/bin:$PYENV_ROOT/bin:$RBENV_ROOT/bin:$PATH:/opt/idea/bin"

# fetchmail -s -d 60

eval "$(pyenv init -)" # this makes pyenv work in the shell
eval "$(pyenv virtualenv-init - zsh)"
# source $PYENV_ROOT/completions/pyenv.bash
# eval "$(rbenv init -)"

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/home/me/projects/gcp-functions/google-cloud-sdk/path.zsh.inc' ]; then . '/home/me/projects/gcp-functions/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/home/me/projects/gcp-functions/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/me/projects/gcp-functions/google-cloud-sdk/completion.zsh.inc'; fi

export EDITOR=nvim
alias vim=nvim

test -n "${terminfo[kcuu1]}" && bindkey "${terminfo[kcuu1]}" up-line-or-history
test -n "${terminfo[kcud1]}" && bindkey "${terminfo[kcud1]}" down-line-or-history

WORDCHARS='_-*'

unsetopt inc_append_history
unsetopt share_history

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# if [ ! -e "$HOME/.config/second/home" ]; then
# 	echo "error: you must configure ~/.config/second/home"
# 	exit 1
# fi
source $HOME/.config/second/home
export SECOND_HOME

source "$HOME"/.zsecond

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

if [ "$enable_profile" = "1" ]; then
    zprof
fi
