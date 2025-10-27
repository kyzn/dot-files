# fzf
[ -f /opt/homebrew/bin/fzf ] && source <(fzf --zsh)

# username@mac:directory
export PS1='%F{green}%n@mac%f:%F{cyan}%~%f%# '

# ls colors
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

# subl
[ -d "/Applications/Sublime Text.app" ] && export PATH=$PATH:"/Applications/Sublime Text.app/Contents/SharedSupport/bin"

# disable Ctrl-S/Ctrl-Q flow control
stty -ixon

# aliases
alias g='git'
alias gs='git status --short --branch'
alias gg='git grep'
alias up='brew update && brew upgrade && brew cleanup && tldr -u'
alias saveb='export B=$(git rev-parse --abbrev-ref HEAD) && echo $B'