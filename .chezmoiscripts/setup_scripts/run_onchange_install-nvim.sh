#!/bin/bash
wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage && \
    chmod 555 nvim.appimage
mkdir ~/bin
mv nvim.appimage ~/bin/nvim
