#!/bin/bash
# !!! chmod a+x config.sh before running it !!!

# Config all dot files:
# * Copy current files and concatenate "_bak" name.
# * Create symbolik link for the original name.

# echo "pwd: `pwd`"
# echo "\$0: $0"
# echo "basename: `basename -- "$0"`"
# echo "dirname: `dirname -- "$0"`"
# echo "dirname/readlink: $( dirname -- "$( readlink -f -- "$0"; )"; )"

Directory=$(pwd)
echo $Directory

## BASH
### Fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip -P ~/Downloads
#### ZSHRC + oh-my-zsh
cp ./Raw_files/bashrc ~/.bashrc
cp ./Raw_files/zshrc ~/.zshrc
wget https://github.com/ohmyzsh/ohmyzsh.git -P ~./oh-my-zsh

## GIT


## SSH


## NVIM
echo "[Nvim] Template git NvChad"
if [ -d "./nvim/" ]
then
  cd nvim
  git log -1 > last_commit.log
  git pull
  cd ..
else
  git clone https://github.com/NvChad/NvChad.git nvim
fi 
# Patch it with my own configurations.
cd nvim
if [ ! -f "init.lua_bak" ]
then
  cp init.lua init.lua_bak
fi

cat ~/git_repos/dotfiles/nvim/init.lua_bak ~/git_repos/dotfiles/nvim_albertdm_patch/lua_init.patch > ~/git_repos/dotfiles/nvim/init.lua
# Apply ~/git_repos/dotfiles/nvim_albertdm_patch/lua_lspconfig.patch > ~/.config/nvim/lua/custom/configs/lspconfig.lua

cp -rf ../nvim_albertdm_patch/albertdm_cfg lua/albertdm_cfg


# .config files
cd ~/.config
if [[ ! -d "./nvim_original" ]] && [[ -d "./nvim" ]];
then
  cp -rf nvim nvim_original 
fi
if [[ -f "./nvim" ]];
then
  ln -s ~/git_repos/dotfiles/nvim ~/.config/nvim 
fi




