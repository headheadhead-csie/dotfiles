#! /bin/sh
sudo apt update
sudo apt install -y ripgrep bat zsh vim-gtk3 libfuse2
wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage && \
    chmod 555 nvim.appimage && sudo mv nvim.appimage /usr/bin/nvim
sudo chsh -s /bin/zsh $USER

# vim config
sudo update-alternatives --set /bin/vim.gtk3
vim +BundleInstall +qall
