#!/bin/bash

vim -E -u NONE -S ~/.vimrc +PluginInstall +qall > /dev/null

pushd bundle/YouCompleteMe
#git submodule update --init --recursive
#./install.sh --clang-completer --gocode-completer
./install.sh --gocode-completer
popd
