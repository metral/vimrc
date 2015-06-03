#!/bin/bash

echo "Setting up vim..."

apt-get update
apt-get install git build-essential vim -y

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

vim +PluginInstall +GoInstallBinaries +qall now

echo "Completed setup of vim."
popd
