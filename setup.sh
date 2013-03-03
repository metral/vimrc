#!/bin/bash

echo "Setting up vim..."

timestamp=$(date +"%Y%m%d%H%M")
if [ -d ~/.vim ];
then
    echo "Taking a backup of existing vim setup.."
    mv ~/.vim ~/.vim.$timestamp
fi
git clone git://github.com/metral/vimrc ~/.vim
cd ~/.vim
git submodule init
git submodule update

if [ -f ~/.vimrc ];
then
    echo "Taking a backup of existing vimrc..."
    mv ~/.vimrc ~/.vimrc.$timestamp
fi
ln -s ~/.vim/vimrc ~/.vimrc

echo "Completed setup of vim..."
