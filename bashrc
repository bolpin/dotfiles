# If not running interactively, don't do anything
[ -z "$PS1" ] && return  

. ~/bin/dotfiles/bash/env
. ~/bin/dotfiles/bash/config
. ~/bin/dotfiles/bash/aliases

if [[ -s /Users/brian/.rvm/scripts/rvm ]] ; then source /Users/brian/.rvm/scripts/rvm ; fi
