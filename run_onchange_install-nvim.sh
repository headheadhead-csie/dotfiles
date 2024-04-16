#!/bin/bash
wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage && \
    chmod 555 nvim.appimage && sudo mv nvim.appimage /usr/bin/nvim
