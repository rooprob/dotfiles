#  essential aliases

alias v=nvim
alias vim=nvim
alias c=clear
alias e=exit
alias t=tmux
alias s=sudo

alias k="kubectl"
alias kg="kubectl get"
alias kgp="kubectl get pod"
alias kgwf="kubectl get --watch- f"

alias ksg="kubectl --namespace=kube-system get"
alias ksgp="kubectl --namespace=kube-system get pod"

alias kctx="kubectx"
alias kns="kubens"

alias gp="git pull"
alias gs="git status"
alias lg="lazygit"

alias ls="ls --color=auto"
alias la="ls -lathr"
alias lm='find . -type f -not  -path "*/\.*" -exec ls {} +'
