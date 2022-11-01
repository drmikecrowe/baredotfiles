#!/bin/bash

set -e

if [ -z $(which pipx) -o $(pipx --version 2>&1 | grep "pipx: command not found" | wc -l) ]; then
    pip3 install pipx autoflake autokey autopep8 black cfn_flip cfn-lint checkov dephell flake8 git-remote-codecommit google-cloud-iot mypy pip-autoremove pipenv pylint
fi

if [ -z $(which xonsh) ]; then
    pipx install xonsh
    pipx inject xonsh xontrib-autojump xontrib-ssh_agent xonsh-apt-tabcomplete xonsh-docker-tabcomplete xonsh-direnv xontrib-powerline2
    grep -q xonsh /etc/shells || echo "$(which xonsh)" | sudo tee -a /etc/shells > /dev/null
fi

# xonsh-apt-tabcomplete xonsh-docker-tabcomplete xonsh-direnv
# xonsh-apt-tabcomplete xontrib-autojump xonsh-docker-tabcomplete xontrib-ssh-agent xonsh-direnv
# xonsh-apt_tabcomplete xontrib-autojump xontrib-docker_tabcomplete xontrib-ssh_agent xontrib-direnv xontrib-powerline2 xontrib-coreutils
# xonsh-apt_tabcomplete xontrib-autojump xontrib-ssh_agent xontrib-direnv xontrib-powerline2 xontrib-coreutils
# xonsh-apt_tabcomplete xontrib-autojump xontrib-ssh_agent xontrib-powerline2 xontrib-coreutils
# xonsh prompt-toolkit pygments 
# xonsh[ptk,linux,pygments,proctitle]
# xontrib-apt_tabcomplete xontrib-autojump xontrib-docker_tabcomplete xontrib-ssh_agent xontrib-direnv xontrib-powerline2 
# xontrib-apt_tabcomplete xontrib-autojump xontrib-docker_tabcomplete xontrib-ssh_agent xontrib-direnv xontrib-powerline2 xontrib-coreutils
# xontrib-autojump
# xontrib-autojump xontrib-docker_tabcomplete xontrib-ssh_agent xontrib-direnv xontrib-powerline2 
# xontrib-autojump xontrib-ssh_agent xontrib-direnv xontrib-powerline2 
# xontrib-autojump xontrib-ssh_agent xontrib-powerline2 
# xontrib-powerline2
