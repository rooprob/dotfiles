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

# DracOwl-inspired ls colors for macOS (BSD ls) and Linux (GNU ls).
if [[ "$OSTYPE" == darwin* ]]; then
    export CLICOLOR=1
    export LSCOLORS="ExGxFxDxCxDeDfhaadacae"
    alias ls='ls -G'
else
    export LS_COLORS="di=38;5;75:ln=38;5;117:so=38;5;176:pi=38;5;221:ex=38;5;121:bd=38;5;221;48;5;17:cd=38;5;221;48;5;17:su=37;41:sg=30;43:tw=30;42:ow=30;46:*.tar=38;5;176:*.tgz=38;5;176:*.gz=38;5;176:*.zip=38;5;176:*.xz=38;5;176:*.bz2=38;5;176:*.7z=38;5;176:*.jpg=38;5;117:*.jpeg=38;5;117:*.png=38;5;117:*.gif=38;5;117"
    alias ls='ls --color=auto'
fi
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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
