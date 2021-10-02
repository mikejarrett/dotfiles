#! /usr/bin/env bash

# Install vim from source on a debian based system where pyenv is used at thhe user level.
## The python version must already be installed via pyenv
## `pyenv install 3.7.2`
## It is not necessary remove debian installed vim packages


# fail on any error (fix things as needed)
set -e

# Convenience variables
FULL_VERSION="3.9.7"
MM_VERSION="3.9"
VIM_CONDENSED_VER="81"
VIM_TAG="v8.1"

## (optional) uncomment to remove current vim if desired
sudo apt remove -y vim vim-runtime gvim vim-tiny vim-common vim-gui-common vim-nox

# Install dependencies (note no python-dev here)
sudo apt install -y \
    libncurses5-dev \
    libgtk2.0-dev \
    libatk1.0-dev \
    libcairo2-dev \
    libx11-dev \
    libxpm-dev \
    libxt-dev \
    ruby-dev \
    lua5.1 \
    libperl-dev \
    git \
    liblua5.1-0-dev

# Checkout vim
cd /tmp
git clone https://github.com/vim/vim.git
cd vim

# make sure the repo is clean
make distclean

# (optional) Checkout the specific desired version
## umcomment to use specific tagged version
# git pull --tags
# git checkout tags/${VIM_TAG}

# Run `Configure`
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --with-x \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr/local \
            --enable-python3interp=yes \
            --with-python3-config-dir=$HOME/.pyenv/versions/${FULL_VERSION}/lib/python${MM_VERSION}/config-${MM_VERSION}m-x86_64-linux-gnu \
            --includedir=$HOME/.pyenv/versions/${FULL_VERSION}/include/

# Make and set the runtime directory (non default to avoid conflicts)
echo "export VIMRUNTIMEDIR=/usr/local/share/vim/vim${VIM_CONDENSED_VER}" >> ~/.bashrc
source ~/.bashrc

make VIMRUNTIMEDIR=$VIMRUNTIMEDIR


# install (to usr local)
sudo make install

# update alternatives to set our new build as default
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --set editor /usr/local/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
sudo update-alternatives --set vi /usr/local/bin/vim
