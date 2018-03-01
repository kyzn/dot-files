#fix scrolling after lifting finger
xinput --set-int-prop 12 'Fling To Scroll Enabled' 8 0

#export xterm-color
if [ -e /usr/share/terminfo/x/xterm-256color  ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi
#vim loses color in tmux
alias tmux='tmux -2'

#pebblesdk
export PATH=/home/kivanc/pebble-dev/pebble-sdk-4.5-linux64/bin:$PATH
alias pb='pebble build'
alias pc='pebble clean'
alias pe='pebble install --emulator diorite'
alias pp='pebble install --phone 192.168.0.4'

#fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#perlbrew
source ~/perl5/perlbrew/etc/bashrc

# Go stuff
export GOPATH=/home/kivanc/.go
export PATH=$PATH:$GOPATH/bin

# ALIASES!
export DBIC_TRACE=1=/tmp/dbic.log
export DBIC_TRACE_PROFILE="console"
alias l='ls -lah'
alias g='git'
alias gs='git status --short --branch'
alias gg='git grep'
alias gp='rm -f .git/gc.log && git reflog expire --expire-unreachable=now --all && git gc --prune=now'
alias up='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y && sudo apt-get autoclean -y && cpan-outdated -p | cpanm'
alias bt='python3 /home/kivanc/Dropbox/.setup/a2dp.py'
alias tmux='tmux -2'

export M='master'
alias saveb='export B=`git rev-parse --abbrev-ref HEAD` && echo $B'
alias branchs='git for-each-ref --format "%(refname:short)" refs/remotes/origin | while read b; do echo $(git log -1 --format=%ae $b) $b; done | grep $USER'
alias merge_1='git checkout $M    && git pull &&\
               git checkout $B    && git pull &&\
               git fetch --prune  && git rebase --autostash origin/$M &&\
               git push --force-with-lease &&\
               git checkout $M    && git pull'
alias merge_2='git merge $B && git pull && git push && git push origin :$B && git branch --delete $B'
