#!/bin/bash
sudo apt update && sudo apt install -y wget ripgrep bat zsh vim-gtk3 \
    libfuse2 curl xterm git openssh-client openssh-server tig

# change the apt source if using Debian
if [[ -n $(cat /etc/*-release | grep -i "name.*debian") ]]; then
    sed -i "s/deb.debian.org/debian.csie.ntu.edu.tw/g" /etc/apt/sources.list
    sed -i "s/deb.debian.org/debian.csie.ntu.edu.tw/g" /etc/apt/mirrors/debian.list
    sed -i "s/deb.debian.org/debian.csie.ntu.edu.tw/g" /etc/apt/mirrors/debian-security.list
fi

# setting the ssh server
sudo dpkg-reconfigure openssh-server
ssh-keygen
