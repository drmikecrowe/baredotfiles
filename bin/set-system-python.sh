#!/bin/bash

update-alternatives --list python
if [[ $? != 0 ]]; then
    update-alternatives --install /usr/bin/python python /usr/bin/python2 20
    update-alternatives --install /usr/bin/python python /usr/bin/python3 10
    update-alternatives --set python /usr/bin/python3
fi
python -m pip install pip --upgrade
pip3 install --upgrade pipenv git-remote-codecommit
update-alternatives --list python
