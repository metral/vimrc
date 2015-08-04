#!/bin/bash

git submodule update --remote --recursive
git add .
git commit -m "Submodule sync"
git push

#vim +PluginInstall! +GoInstallBinaries! +qall now > /dev/null 2>&1
vim -E -u NONE -S ~/.vimrc +PluginInstall +GoInstallBinaries +qall > /dev/null
