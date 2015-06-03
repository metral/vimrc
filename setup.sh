#!/bin/bash

echo "Setting up vim..."

git clone git://github.com/metral/vimrc ~/.vim
pushd ~/.vim
git remote set-url origin git@github.com:metral/vimrc.git
git submodule init
git submodule update

pushd bundle/YouCompleteMe
git submodule update --init --recursive
./install.sh --clang-completer
popd

vim +PluginInstall +qall now
sleep 2
vim +GoInstallBinaries +qall now

ln -s ~/.vim/vimrc ~/.vimrc

echo "Completed setup of vim..."
popd
