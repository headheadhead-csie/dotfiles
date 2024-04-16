#!/bin/sh

# vim config
vim --clean "+source ~/.vimrc" +PluginInstall +qall
sudo update-alternatives --set editor /bin/vim.gtk3
