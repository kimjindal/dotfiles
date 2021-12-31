export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

export PATH="/usr/local/sbin:$PATH"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad
# dir/simlink/socket/pip/exe/block/spcial/setuid/setgid/sticky/sticky
# a:black/b:red/c:green/d:yellow/e:blue/f:magenta/g:cyan/h:lightgray/x:default
export GREP_OPTIONS='--color=auto'


alias ll='ls -alF'
alias la='ls -A'
alias ld='ls -Ap | grep /$'
alias lf='ls -Ap | grep -v /$'
alias cls=clear

export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/Developer/flutter/bin"
export PATH="$PATH:$HOME/nvim-osx64/bin"

export PATH="/usr/local/opt/llvm/bin:$PATH"
. "$HOME/.cargo/env"
