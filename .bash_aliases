# GPG to prompt password on tty
export GPG_TTY=$(tty)

# vim loses color in tmux
alias tmux='tmux -2'

# start ssh-agent automagically
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add

# make tmux remember ssh keys
if [ -S "$SSH_AUTH_SOCK" ] && [ ! -h "$SSH_AUTH_SOCK" ]; then
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# perlbrew
source ~/perl5/perlbrew/etc/bashrc

# Go stuff
export GOPATH=~/.go
export PATH=$PATH:$GOPATH/bin

# DBIC Trace
export DBIC_TRACE=1=/tmp/dbic.log
export DBIC_TRACE_PROFILE="console"

# ALIASES!
export M='master'
alias g='git'
alias gs='git status --short --branch'
alias gg='git grep'
alias gp='rm -f .git/gc.log && git reflog expire --expire-unreachable=now --all && git gc --prune=now'
alias up='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y && sudo apt-get autoclean -y && cpan-outdated -p | cpanm'
alias saveb='export B=`git rev-parse --abbrev-ref HEAD` && echo $B'
alias branchs='git for-each-ref --format "%(refname:short)" refs/remotes/origin | while read b; do echo $(git log -1 --format=%ae $b) $b; done | grep $USER'
alias merge_1='git checkout $M    && git pull &&\
               git checkout $B    && git pull &&\
               git fetch --prune  && git rebase --autostash origin/$M &&\
               git push --force-with-lease &&\
               git checkout $M    && git pull'
alias merge_2='git merge $B && git pull && git push && git push origin :$B && git branch --delete $B'
