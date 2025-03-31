#!/bin/bash
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.appimage && \
    chmod 555 nvim-linux-x86_64.appimage
mkdir ~/bin
mv nvim-linux-x86_64.appimage ~/bin/nvim
