#!/bin/bash

pushd bundle/YouCompleteMe
git submodule update --init --recursive
./install.sh --clang-completer
popd
