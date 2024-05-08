# Set up the prompt

# https://github.com/sindresorhus/pure?tab=readme-ov-file#getting-started
fpath=( "$HOME/.zsh/pure" "${fpath[@]}" )
autoload -Uz promptinit
promptinit
prompt pure

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
source "$HOME/.config/second/home"
export SECOND_HOME

source "$HOME/.zsecond"
export EDITOR=nvim
alias vim=nvim
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

export PYENV_ROOT="$HOME/.pyenv"
export RBENV_ROOT="$HOME/.rbenv"
export GOPATH=~/go
export PRIVATE_BIN=$HOME/.bin
export PATH="$PRIVATE_BIN:$HOME/.local/bin:$GOPATH/bin:/opt/nvim-linux64/bin:$HOME/.cargo/bin:$PYENV_ROOT/bin:$RBENV_ROOT/bin:$PATH:/opt/idea/bin"

# fetchmail -s -d 60

# eval "$(pyenv init -)" # this makes pyenv work in the shell
eval "$(pyenv virtualenv-init - zsh)"
export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use # This loads nvm
