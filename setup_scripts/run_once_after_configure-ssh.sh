#!/bin/bash

# setting the ssh server
sudo dpkg-reconfigure openssh-server
if [[ ! -f ~/.ssh/id_rsa ]]; then
    ssh-keygen
fi
