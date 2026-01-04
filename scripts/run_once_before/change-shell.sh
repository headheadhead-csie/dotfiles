#!/bin/bash
rm -rf ~/.oh-my-zsh/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
rm -rf ~/.oh-my-zsh/plugins/
sudo chsh -s $(which zsh) $(whoami)
