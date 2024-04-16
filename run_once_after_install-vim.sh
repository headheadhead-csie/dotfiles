#!/bin/sh

# vim config
vim --clean "+source ~/.vimrc" +PluginInstall +qall
sudo update-alternatives --set editor /usr/bin/vim.gtk3
