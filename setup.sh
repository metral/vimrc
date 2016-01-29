#!/bin/bash

echo "Setting up vim..."

sudo apt-get update
sudo apt-get -y install git build-essential vim-nox cmake python-dev python3-dev < "/dev/null"

# Install lua from binaries
sudo apt-get -y install liblua5.1-dev luajit libluajit-5.1 < "/dev/null"

# Remove old vims
sudo apt-get -y remove vim vim-runtime gvim < "/dev/null"

sudo apt-get -y remove vim-tiny vim-common vim-gui-common < "/dev/null"

sudo rm -rf /usr/local/bin/vim /usr/bin/vim

sudo mkdir /usr/include/lua5.1/include
sudo mv /usr/include/lua5.1/*.h /usr/include/lua5.1/include/

git clone https://github.com/vim/vim ~/vim
pushd ~/vim
pushd src
sudo make distclean
./configure --with-features=huge \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7-config \
            --enable-perlinterp \
            --enable-cscope --prefix=/usr \
            --enable-luainterp \
            --with-luajit \
            --with-lua-prefix=/usr/include/lua5.1
sudo make -j4 VIMRUNTIMEDIR=/usr/share/vim/vim74
sudo make install

git clone https://github.com/metral/vimrc.git ~/.vim
pushd ~/.vim
git clone https://github.com/sunaku/vim-unbundle.git vim-unbundle

git submodule init
git submodule update

ln -s ~/.vim/vimrc ~/.vimrc

#pushd bundle/YouCompleteMe
#git submodule update --init --recursive
#./install.sh --clang-completer --gocode-completer
#popd

#vim +PluginInstall +GoInstallBinaries +qall > /dev/null 2>&1
#vim -E -S ~/.vimrc +PluginInstall +GoInstallBinaries +GoUpdateBinaries +qall

rm -rf ~/vim

echo "alias vi='vim'" >> ~/.bashrc

echo ""
echo "********************************"
echo " Source ~/.bashrc"
echo "********************************"

popd

