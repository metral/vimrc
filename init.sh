#!/bin/bash

git submodule update --remote --recursive

git submodule foreach git pull origin master
for i in ~/.vim/bundle/*; do git -C $i pull; done

#vim -E -u NONE -S ~/.vimrc +PluginInstall +GoInstallBinaries +qall > /dev/null
vim -E -u NONE -S ~/.vimrc +PluginInstall +GoInstallBinaries +GoUpdateBinaries +qall

rm -rf $GOPATH/bin/gocode
ps aux | grep gocode-gomod | awk '{print $2}' | xargs kill -9
ps aux | grep gocode | awk '{print $2}' | xargs kill -9
go get -u github.com/stamblerre/gocode
gocode close
