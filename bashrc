export PATH="$PATH:$HOME/Library/Python/3.8/bin"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.bin" # Add local bin
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
complete -C aws_completer aws
#complete -C '/usr/local/bin/aws_completer' aws-okta

# Go env
export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"
export GO111MODULE=on
export GOPRIVATE=github.com/knackshops

export TERM=xterm-256color

set -o vi

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

force_color_prompt=yes
color_prompt=yes

alias gocd=go_lpk
go_lpk()
{
  cd $(lpk $1)
}

view_md()
{
  # linux
  # pandoc -s -f markdown -t man $1 | man -l -
  # mac
  pandoc -s -f markdown -t man $1 | groff -T utf8 -man | less
}

alias mdless=view_md

alias tags="ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths);starscope -e ctags"

alias ls='ls -G'

alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gs='git status -sb'
alias gp='git pull --rebase origin main'

alias iotop='sudo iotop -Pao'

alias git_clean='git branch --merged main | grep -v main | xargs git branch -d'

alias cdg='cd $(git rev-parse --show-cdup)'

alias dockerrm='docker rm -f $(docker ps -a -q)'
alias dockerstop='docker stop $(docker ps -a -q)'
alias dockerup='AWS_SDK_LOAD_CONFIG=true AWS_PROFILE=realself-test bundle exec rake docker:start'

alias rmswp='find . -name '*.swp' -exec rm '{}' \;'

alias curls='curl -vv -s --output /dev/null'

alias gw='gh run watch --exit-status && echo "run completed and successful"'

export EDITOR=vim

stty ixany
stty ixoff -ixon
stty stop undef
stty start undef

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /$HOME/Library/Python/3.8/lib/python/site-packages/powerline/bindings/bash/powerline.sh
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

alias ycmrebuild="cd ~/.vim/plugged/YouCompleteMe;./install.py --ts-completer --go-completer --clangd-completer"

### NVM
find-up() {
    path=$(pwd)
    while [[ "$path" != "" && ! -e "$path/$1" ]]; do
        path=${path%/*}
    done
    echo "$path"
}

cdnvm() {
    cd "$@";
    nvm_path=$(find-up .nvmrc | tr -d '\n')

    # If there are no .nvmrc file, use the default nvm version
    if [[ ! $nvm_path = *[^[:space:]]* ]]; then

        declare default_version;
        default_version=$(nvm version default);

        # If there is no default version, set it to `node`
        # This will use the latest version on your machine
        if [[ $default_version == "N/A" ]]; then
            nvm alias default node;
            default_version=$(nvm version default);
        fi

        # If the current version is not the default version, set it to use the default version
        if [[ $(nvm current) != "$default_version" ]]; then
            nvm use default;
        fi

        elif [[ -s $nvm_path/.nvmrc && -r $nvm_path/.nvmrc ]]; then
        declare nvm_version
        nvm_version=$(<"$nvm_path"/.nvmrc)

        declare locally_resolved_nvm_version
        # `nvm ls` will check all locally-available versions
        # If there are multiple matching versions, take the latest one
        # Remove the `->` and `*` characters and spaces
        # `locally_resolved_nvm_version` will be `N/A` if no local versions are found
        locally_resolved_nvm_version=$(nvm ls --no-colors "$nvm_version" | tail -1 | tr -d '\->*' | tr -d '[:space:]')

        # If it is not already installed, install it
        # `nvm install` will implicitly use the newly-installed version
        if [[ "$locally_resolved_nvm_version" == "N/A" ]]; then
            nvm install "$nvm_version";
        elif [[ $(nvm current) != "$locally_resolved_nvm_version" ]]; then
            nvm use "$nvm_version";
        fi
    fi
}
alias cd='cdnvm'
# cd $PWD
### end NVM
