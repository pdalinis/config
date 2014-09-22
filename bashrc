#use local cntlm proxy to get thru isa firewall.
export http_proxy=http://localhost:3128
export HTTP_PROXY=http://localhost:3128
export https_proxy=http://localhost:3128
export HTTPS_PROXY=http://localhost:3128
export RSYNC_PROXY=http://localhost:3128
export GOPATH=~/go
export GOROOT=/usr/local/go
export CDPATH=$GOPATH/src/github.com:$GOPATH/src/code.google.com/p:$GOPATH/src/git.nordstrom.net:~/src

# If not running interactively, don't do anything
#case $- in
#    *i*) ;;
#      *) return;;
#esac

#add the .local/bin to path, powerline and other utils are here.
export PATH=~/src/jukebox/bin:~/.local/bin:/usr/local/bin:/usr/local/go/bin:~/go/bin:~/.rbenv/bin:$PATH
eval "$(rbenv init -)"

#force 256 color
export TERM=xterm-256color

export CLIENT_ID=x3i3

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

force_color_prompt=yes
color_prompt=yes

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

calc_chefsum()
{
  shasum -a 256 $1 | cut -c-12
}

alias chefsum=calc_chefsum

view_md()
{
  pandoc -s -f markdown -t man $1 | man -l -
}

alias mdless=view_md 

# enable color support of ls and also add handy aliases
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gs='git status -sb'

alias iotop='sudo iotop -Pao'

alias ps='ps axf'
alias cat='vimcat'
alias more='vimpager'

alias gocd='cd `go list -f '{{.Dir}}' $1`'

export EDITOR=vim

alias pr_ssi='RBENV_VERSION=system stash-pull-request.rb "Technology Self Service Infrastructure"'
stty ixany
stty ixoff -ixon
stty stop undef
stty start undef

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
export PROMPT_COMMAND=""
. ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
