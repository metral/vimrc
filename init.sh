#!/bin/bash

git submodule update --remote --recursive

git submodule foreach git pull origin master
for i in ~/.vim/bundle/*; do git -C $i pull; done

#vim +PluginInstall! +GoInstallBinaries! +qall now > /dev/null 2>&1
#vim -E -u NONE -S ~/.vimrc +PluginInstall +GoInstallBinaries +qall > /dev/null
vim -E -u NONE -S ~/.vimrc +PluginInstall +GoInstallBinaries +GoUpdateBinaries +qall
