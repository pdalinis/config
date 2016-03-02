[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette_osx.sh"

source ~/.vim/git-completion.bash

[[ -s ~/.bashrc ]] && source ~/.bashrc

test -r /sw/bin/init.sh && . /sw/bin/init.sh
