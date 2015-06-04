#!/bin/bash

echo "Setting up vim..."

sudo apt-get update
sudo apt-get install git build-essential vim -y

git clone git://github.com/metral/vimrc ~/.vim
pushd ~/.vim
git remote set-url origin git@github.com:metral/vimrc.git
git submodule init
git submodule update

ln -s ~/.vim/vimrc ~/.vimrc

pushd bundle/YouCompleteMe
git submodule update --init --recursive
./install.sh --clang-completer
popd

vim +PluginInstall +GoInstallBinaries +qall > /dev/null 2>&1
popd
