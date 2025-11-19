#!/bin/bash

NEOVIM_HOME=~/.neovim
NEOVIM_CONFIG=~/.config/nvim
CURRENT_USER=$(whoami)

rm -rf $NEOVIM_CONFIG
rm -rf $NEOVIM_HOME
mkdir -p $NEOVIM_CONFIG
mkdir $NEOVIM_HOME
chmod -R 777 $NEOVIM_HOME $NEOVIM_CONFIG
cp -r ./init.vim ./install.sh ./coc-settings.json .my_nvimrc .gittemplate $NEOVIM_CONFIG 

#install node
if [ -z $NVM_DIR ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
    source ~/.bashrc
    nvm install
fi
npm i intelephense -g

#bash config 
if [ -z $MY_NVIMRC ]; then
    echo "source $NEOVIM_CONFIG/.my_nvimrc > /dev/null" >> ~/.bashrc
    source ~/.bashrc
fi

# install eclip e pynvim
sudo apt install python3 xclip -y
pip install pynvim


#nvim install
if [[ ! -f "$NEOVIM_HOME/nvim-linux-x86_64/bin/nvim" ]]; then
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    tar -C $NEOVIM_HOME -xzf nvim-linux-x86_64.tar.gz
fi

# install VimPlug
if [[ ! -f  "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim" ]]; then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
        --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

chown -R $CURRENT_USER:$CURRENT_USER $NEOVIM_HOME $NEOVIM_CONFIG

# git config
git config --global user.name "SamuelPatrickMeneses"
git config --global user.email "samuelmeneses800@gmail.com"
git config --global commit.template ./.config/nvim/.gittemplate
git config --global core.editor "$NEOVIM_HOME/nvim-linux-x86_64/bin/nvim"

# instala os plugins do neovim
$NEOVIM_HOME/nvim-linux-x86_64/bin/nvim -c PlugInstall
