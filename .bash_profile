#Postgres.app path
export PATH=/Users/leklund/.rvm/usr:/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin:/opt/local/bin:/opt/local/sbin:/usr/local/heroku/bin:/usr/local/bin:$HOME/.rvm/bin:/Applications/Postgres.app/Contents/Versions/9.3/bin:/opt/local/libexec/perl5.16/sitebin:/Users/leklund/Library/Python/2.7/bin:$PATH:/Users/leklund/bin:/usr/local/mysql/bin

# /opt postgres path
#export PATH=/Users/leklund/.rvm/usr:/opt/local/bin:/opt/local/sbin:/opt/local/lib/postgresql92/bin:/usr/local/bin:/opt/local/libexec/perl5.16/sitebin:$PATH:/Users/leklund/bin:/usr/local/mysql/bin

#export PATH=/Users/leklund/.rvm/usr:/Applications/Postgres.app/Contents/MacOS/bin:$PATH:/Users/leklund/bin:/usr/local/mysql/bin

powerline_path=$(python -c 'import pkgutil; print pkgutil.get_loader("powerline").filename' 2>/dev/null)
if [[ "$powerline_path" != "" ]]; then
  source ${powerline_path}/bindings/bash/powerline.sh
else
  PROMPTCOLOR=34
  OTHERCOLOR=31
  BRACKET='\[\e[0;${OTHERCOLOR}m\]'
  TEXT='\[\e[0;${PROMPTCOLOR}m\]'
  HOSTY='mjollnir'
  NORMAL="\[\e[0;0m\]"
  ALERT="\[\e[41m\]\[\e[1;33m\]"
  PS1="$BRACKET[$TEXT$HOSTY$BRACKET($TEXT\w$BRACKET)] $NORMAL"
fi

export PGSSLMODE=allow

#completion
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

source ~/.git-flow-completion.bash
source ~/.git-completion.bash

#history
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S - "
shopt -s histappend
HISTSIZE=50000

#use ports vim
export EDITOR='/opt/local/bin/vim'
export VISUAL='/opt/local/bin/vim'
export PAGER='/opt/local/bin/most'

alias ls="ls -G"
alias g=git
alias ll="ls -lh"
alias la="ls -alh"
alias lrt="ls -lrth"


source ~/.private_aliases
umask 002

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#python
export WORKON_HOME=$HOME/.virtualenvs
source /opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh

#heroku completion
source "/Users/leklund/.heroku/plugins/heroku-bash-completion/heroku-completion.bash"

eval "$(direnv hook $0)"
