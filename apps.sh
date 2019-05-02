#!/usr/bin/env bash
sudo apt update
sudo apt install -y \
    build-essential \
    checkinstall \
    git \
    git-gui \
    libatk1.0-dev \
    libbonoboui2-dev \
    libcairo2-dev \
    libgnome2-dev \
    libgnomeui-dev \
    libgtk2.0-dev \
    liblua5.1-0 \
    liblua5.1-dev \
    libluajit-5.1 \
    libncurses5-dev \
    libperl-dev \
    libx11-dev \
    libxpm-dev \
    libxt-dev \
    lua5.1 \
    luajit \
    meld \
    python-dev \
    python3-dev \
    python3-pip \
    ruby-dev \
    shellcheck

sudo pip3 install \
    black \
    ipdb \
    requests \
    --upgrade

sudo apt update --yes
sudo apt autoremove
