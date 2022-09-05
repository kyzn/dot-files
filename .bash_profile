# This one taken (and modified) from ubuntu default settings
export PS1='\[\e]0;\u@mac: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@mac\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '

# add colors to ls
# alias ls='ls --color' should do too
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

# GPG to prompt password on tty
export GPG_TTY=$(tty)

# vim loses color in tmux
alias tmux='tmux -2'

# crontab should use vim
export VISUAL=vim

# Fix for QT causing wifi lags
export QT_BEARER_POLL_TIMEOUT=-1

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

# git-hub
[ -f ~/.git-hub/.rc ] && source ~/.git-hub/.rc

# perlbrew
[ -d ~/perl5/perlbrew/ ] && source ~/perl5/perlbrew/etc/bashrc

# chruby
[ -d /opt/homebrew/opt/chruby/share/chruby/ ] && source /opt/homebrew/opt/chruby/share/chruby/chruby.sh && source /opt/homebrew/opt/chruby/share/chruby/auto.sh && chruby ruby-2.7.2

# brew
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH

# use openssl (not libressl)
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"

# Python 3 pip
export PATH=$PATH:~/.local/bin

# sublime-text's subl
export PATH=$PATH:/Applications/Sublime\ Text.app/Contents/SharedSupport/bin

# DBIC Trace
export DBIC_TRACE=1=/tmp/dbic.log
export DBIC_TRACE_PROFILE="console"

# Disable Ctrl-S and Ctrl-Q
stty stop ''
stty start ''
stty -ixon
stty -ixoff

# ALIASES!
alias g='git'
alias gs='git status --short --branch'
alias gg='git grep'
alias gp='rm -f .git/gc.log && git reflog expire --expire-unreachable=now --all && git gc --prune=now'
alias up='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y && sudo apt-get autoclean -y && cpan-outdated -p | cpanm'
alias saveb='export B=`git rev-parse --abbrev-ref HEAD` && echo $B'
alias branchs='git for-each-ref --format "%(refname:short)" refs/remotes/origin | while read b; do echo $(git log -1 --format=%ae $b) $b; done | grep $USER'
alias merge_1='git checkout `git ma` && git pull &&\
               git checkout $B       && git pull &&\
               git fetch --prune     && git rebase --ignore-date origin/`git ma` &&\
               git push --force-with-lease &&\
               git checkout `git ma` && git pull'
alias merge_2='git merge $B && git pull && git push && git push origin :$B && git branch --delete $B'
