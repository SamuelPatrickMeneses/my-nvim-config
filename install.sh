#!/bin/bash

git config --global user.name "SamuelPatrickMeneses"
git config --global user.email "samuelmeneses800@gmail.com"


NEOVIM_HOME=~/.neovim
NEOVIM_CONFIG=~/.config/nvim
CURRENT_USER=$(whoami)
git config --global core.editor "$NEOVIM_HOME/nvim-linux-x86_64/bin/nvim"

rm -rf $NEOVIM_CONFIG
rm -rf $NEOVIM_HOME
mkdir -p $NEOVIM_CONFIG
mkdir $NEOVIM_HOME
chmod -R 777 $NEOVIM_HOME $NEOVIM_CONFIG
cp -r ./init.vim ./install.sh ./coc-settings.json $NEOVIM_CONFIG 

#install node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
source ~/.bashrc
nvm install
npm i intelephense -g

#bash config 

echo "source $NEOVIM_CONFIG/.my_nvimrc > /dev/null" >> ~/.bashrc
source ~/.bashrc

# install eclip
sudo apt install xclip -y

# pynvim
sudo apt install python3 
pip install pynvim


#nvim install
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo tar -C $NEOVIM_HOME -xzf nvim-linux-x86_64.tar.gz


# install VimPlug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

sudo chown -R $CURRENT_USER:$CURRENT_USER $NEOVIM_HOME $NEOVIM_CONFIG

$NEOVIM_HOME/nvim-linux-x86_64/bin/nvim -c PlugInstall
