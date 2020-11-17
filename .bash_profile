[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

if [ -f ~/.agent.env ] ; then
    . ~/.agent.env > /dev/null
    if ! kill -0 $SSH_AGENT_PID > /dev/null 2>&1; then
        echo "Stale agent file found. Spawning new agent… "
        eval `ssh-agent | tee ~/.agent.env`
        ssh-add
    fi
else
    echo "Starting ssh-agent"
    eval `ssh-agent -s | tee ~/.agent.env`
    ssh-add
fi
[ -r ~/.bashrc ] && . ~/.bashrc
