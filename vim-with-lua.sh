#!/bin/bash 

# Remove previous installations
sudo apt-get remove vim vim-runtime vim-tiny vim-common

# Install dependencies
sudo apt-get install libncurses5-dev python-dev libperl-dev ruby-dev liblua5.2-dev

# Fix liblua paths
sudo ln -s /usr/include/lua5.2 /usr/include/lua
sudo ln -s /usr/lib/x86_64-linux-gnu/liblua5.2.so /usr/local/lib/liblua.so

# Clone vim sources
sudo apt-get install mercurial
hg clone https://code.google.com/p/vim/

cd vim
./configure --prefix=/usr     \
    --enable-luainterp=yes    \
    --enable-perlinterp=yes   \
    --enable-pythoninterp=yes \
    --enable-rubyinterp=yes   \
    --enable-cscope           \
    --disable-netbeans        \
    --enable-multibyte        \
    --enable-largefile        \
    --enable-gui=no           \
    --with-features=huge      \
    --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu

make VIMRUNTIMEDIR=/usr/share/vim/vim74

sudo apt-get install checkinstall
sudo checkinstall

