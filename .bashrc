# Put everything here!!

# Source it from .bash_profile

export PATH="~/bin:/usr/local/bin:/usr/local/git/bin:/usr/local/sbin:/usr/local/mysql/bin:/Developer/usr/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export EDITOR='mate -w'
export PS1='\u@\h \W \$ '

alias sl=ls
alias more=less

# Set architecture flags - no idea why
export ARCHFLAGS="-arch x86_64"

# Virtualenv wrapper is cool
export WORKON_HOME=~/Environments; 
export PROJECT_HOME=~/Development; 
source /usr/local/bin/virtualenvwrapper.sh;


###############################

# This is a bunch of ssh magic

SSH_ENV="$HOME/.ssh/environment"
  
# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    ssh-agent | sed 's/^echo/#echo/' > "$SSH_ENV"
    echo succeeded
    chmod 600 "$SSH_ENV"
    . "$SSH_ENV" > /dev/null
    ssh-add
}
  
# test for identities
function test_identities {
    # test whether standard identities have been added to the agent already
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $? -eq 0 ]; then
        ssh-add
        # $SSH_AUTH_SOCK broken so we start a new proper agent
        if [ $? -eq 2 ];then
            start_agent
        fi
    fi
}
  
# check for running ssh-agent with proper $SSH_AGENT_PID
if [ -n "$SSH_AGENT_PID" ]; then
    ps -ef | grep "$SSH_AGENT_PID" | grep ssh-agent > /dev/null
    if [ $? -eq 0 ]; then
    test_identities
    fi
# if $SSH_AGENT_PID is not properly set, we might be able to load one from
# $SSH_ENV
else
    if [ -f "$SSH_ENV" ]; then
    . "$SSH_ENV" > /dev/null
    fi
    ps -ef | grep "$SSH_AGENT_PID" | grep -v grep | grep ssh-agent > /dev/null
    if [ $? -eq 0 ]; then
        test_identities
    else
        start_agent
    fi
fi