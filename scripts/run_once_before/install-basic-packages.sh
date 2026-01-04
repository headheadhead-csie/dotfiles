#!/bin/bash
# This script should be called by run_once_before_script.sh

package_list="wget ripgrep bat zsh vim-gtk3 libfuse2 curl xterm
    git openssh-client openssh-server tig iproute2 iptables
    bridge-utils tcpdump python3-venv"

update_package
for package in ${package_list}; do
    install_package $package
done

# change the apt source if using Debian
if [[ -n $(cat /etc/*-release | grep -i "name.*debian") ]]; then
    sed -i "s/deb.debian.org/debian.csie.ntu.edu.tw/g" /etc/apt/sources.list
    sed -i "s/deb.debian.org/debian.csie.ntu.edu.tw/g" /etc/apt/mirrors/debian.list
    sed -i "s/deb.debian.org/debian.csie.ntu.edu.tw/g" /etc/apt/mirrors/debian-security.list
fi
