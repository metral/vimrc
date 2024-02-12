#!/bin/bash

git reset --hard origin/master
git pull

git submodule update --remote --recursive

git submodule foreach git pull origin master
for i in ~/.vim/bundle/*; do git -C $i pull; done

git add .
git commit -m "Submodule sync"
git push

vim -E -u NONE -S ~/.vimrc +PluginInstall +GoInstallBinaries +GoUpdateBinaries +qall
