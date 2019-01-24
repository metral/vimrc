#!/bin/bash

git submodule update --remote --recursive

git submodule foreach git pull origin master
for i in ~/.vim/bundle/*; do git -C $i pull; done

git add .
git commit -m "Submodule sync"
git push

#vim +PluginInstall! +GoInstallBinaries! +qall now > /dev/null 2>&1
#vim -E -u NONE -S ~/.vimrc +PluginInstall +GoInstallBinaries +qall > /dev/null
vim -E -u NONE -S ~/.vimrc +PluginInstall +GoInstallBinaries +GoUpdateBinaries +qall
rm -rf $GOPATH/bin/gomod
ps aux | grep gocode-gomod | awk '{print $2}' | xargs kill -9
ps aux | grep gocode | awk '{print $2}' | xargs kill -9
go get -u github.com/stamblerre/gocode
gocode close
