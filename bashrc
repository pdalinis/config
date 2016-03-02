
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.bin" # Add local bin
complete -C aws_completer aws

export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"

export TERM=xterm-256color

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

force_color_prompt=yes
color_prompt=yes


calc_chefsum()
{
  shasum -a 256 $1 | cut -c-12
}

alias chefsum=calc_chefsum

view_md()
{
  # linux
  # pandoc -s -f markdown -t man $1 | man -l -
  # mac
  pandoc -s -f markdown -t man $1 | groff -T utf8 -man | less
}

alias mdless=view_md

ssh_aws()
{
  ssh -i ~/.ssh/shsMain.pem ubuntu@$1
}

alias ssha=ssh_aws

alias ls='ls -G'

alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gs='git status -sb'
alias gp='git pull --rebase'

alias iotop='sudo iotop -Pao'

alias gocd='cd `go list -f '{{.Dir}}' $1`'

alias git_clean='git branch --merged master | grep -v master | xargs git branch -d'

alias cdg='cd $(git rev-parse --show-cdup)'

export EDITOR=vim

stty ixany
stty ixoff -ixon
stty stop undef
stty start undef

  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

. /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
