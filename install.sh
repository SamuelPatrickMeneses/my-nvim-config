#!/bin/bash

NEOVIM_HOME=~/.neovim
NEOVIM_CONFIG=~/.config/nvim

rm -rf $NEOVIM_CONFIG
rm -rf $NEOVIM_HOME
mkdir -p $NEOVIM_CONFIG
mkdir $NEOVIM_HOME
cp -r ./init.vim ./install.sh ./coc-settings.json $NEOVIM_CONFIG 

#install node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
nvm install
npm i intelephense -g

# install eclip
sudo apt install xclip -y

# make Tab auto-completion case-insensitive in Bash?
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi
echo "echo 'set completion-ignore-case On' >> ~/.inputrc" > ~/.bashrc

#nvim install
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo tar -C $NEOVIM_HOME -xzf nvim-linux-x86_64.tar.gz

echo 'export PATH="$PATH:~/.neovim/nvim-linux64/bin"' >> ~/.bashrc
echo 'alias v=nvim' >> ~/.bashrc
source ~/.bashrc

# install VimPlug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

$NEOVIM_HOME/nvim-linux64/bin/nvim -c PlugInstall
