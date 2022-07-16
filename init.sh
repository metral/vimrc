#!/bin/bash

git submodule update --remote --recursive

git submodule foreach git pull origin master
for i in ~/.vim/bundle/*; do git -C $i pull; done

vim -E -u NONE -S ~/.vimrc +PluginInstall +GoInstallBinaries +GoUpdateBinaries +qall
