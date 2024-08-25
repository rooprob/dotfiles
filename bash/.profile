# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
export PRIVATE_BIN=$HOME/.bin
if [ -d "$PRIVATE_BIN" ]; then
    PATH="$PRIVATE_BIN:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes user's cargo bin if it exists
if [ -d "$HOME/.cargo/bin" ]; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

# set PATH so it includes opt's nvim bin if it exists
if [ -d "/opt/nvim-linux64/bin" ]; then
    PATH="/opt/nvim-linux64/bin:$PATH"
fi

# set PATH so it includes opt's frame
if [ -d "/opt/frame/bin" ]; then
    PATH="/opt/frame/bin:$PATH"
fi

# set PATH so it includes user's private perl bin if it exists
if [ -d "$HOME/perl5/bin" ]; then
    PATH="$HOME/perl5/bin:$PATH"
fi
export PERL5LIB=$HOME/perl5/lib/perl5

export EDITOR=nvim

export PYENV_ROOT="$HOME/.pyenv"
PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export NVM_DIR="${HOME}/.nvm"
source "$NVM_DIR/nvm.sh" # This loads nvm
