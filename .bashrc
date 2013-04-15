# Put everything here!!

export BASH_ENV="~/.bashrc"

# Source it from .bash_profile

export PATH="~/bin:/usr/local/opt/ruby/bin:/usr/local/bin:/usr/local/git/bin:/usr/local/sbin:/usr/local/mysql/bin:/Developer/usr/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export EDITOR='mate -w'
export PS1='\u@\h \W \$ '

alias sl=ls
alias more=less
alias m=mate
alias gs="git status"

# Set architecture flags - no idea why
export ARCHFLAGS="-arch x86_64"

# Virtualenv wrapper is cool
export WORKON_HOME=~/Environments; 
export PROJECT_HOME=~/Development; 
source /usr/local/bin/virtualenvwrapper.sh;

###############################

SCRIPTS=~/files/scripts

source $SCRIPTS/cds
source $SCRIPTS/ssh
