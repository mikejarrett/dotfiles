#!/usr/bin/env bash
# remove any existing vim installations
sudo apt remove vim vim-runtime gvim vim-tiny vim-common vim-gui-common vim-nox

# update the repos and install required software
sudo apt update
sudo apt install -y \
    checkinstall \
    git \
    libatk1.0-dev \
    libbonoboui2-dev \
    libcairo2-dev \
    libgnome2-dev \
    libgnomeui-dev \
    libgtk2.0-dev \
    liblua5.1-dev \
    libluajit-5.1 \
    libncurses5-dev \
    libperl-dev \
    libx11-dev \
    libxpm-dev \
    libxt-dev \
    lua5.1 \
    luajit \
    python-dev \
    python3-dev \
    ruby-dev

# clone vim into the /tmp dir
cd /tmp
git clone https://github.com/vim/vim.git
cd vim
# configure with the options that we want
./configure \
    --disable-netbeans \
    --enable-cscope \
    --enable-fontset \
    --enable-gui=auto \
    --enable-gui=gtk2 \
    --enable-largefile \
    --enable-luainterp \
    --enable-luainterp=yes \
    --enable-multibyte \
    --enable-perlinterp=dynamic \
    --enable-perlinterp=yes \
    --enable-python3interp=yes \
    --enable-pythoninterp=yes \
    --enable-rubyinterp=yes \
    --prefix=/usr/local
    --with-compiledby="mike" \
    --with-features=huge \
    --with-luajit \
    --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
    --with-python3-config-dir=/usr/lib/python3.5/config-3.6m-x86_64-linux-gnu \
    --with-ruby-command=/usr/bin/ruby \
    --with-x \
    --enable-fail-if-missing

make VIMRUNTIMEDIR=/usr/local/share/vim/vim81
# install using checkinstall so if we ant eaasier removal
# we can run `dpkg -r vim`
sudo checkinstall

# we don't want apt to update it
echo "vim hold" | sudo dpkg --set-selections

# set alternative commands
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --set editor /usr/local/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
sudo update-alternatives --set vi /usr/local/bin/vim
