# GPG to prompt password on tty
export GPG_TTY=$(tty)

# vim loses color in tmux
alias tmux='tmux -2'

# start ssh-agent and add keys automatically
# also make sure tmux remembers keys
if [ -d ~/.ssh ] && [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
  export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
  ssh-add -l > /dev/null || ssh-add
fi

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# perlbrew
[ -d ~/perl5/perlbrew/ ] && source ~/perl5/perlbrew/etc/bashrc

# Go
export GOPATH=~/.go
export PATH=$PATH:$GOPATH/bin

# Rakudo
export PATH=$PATH:~/rakudo/bin:~/rakudo/share/perl6/site/bin

# Android studio
export PATH=$PATH:~/android-studio/bin

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
               git fetch --prune  && git rebase --ignore-date origin/$M &&\
               git push --force-with-lease &&\
               git checkout $M    && git pull'
alias merge_2='git merge $B && git pull && git push && git push origin :$B && git branch --delete $B'
