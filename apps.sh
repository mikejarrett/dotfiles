#!/usr/bin/env bash
sudo apt update
sudo apt install -y \
    apt-transport-https \
    arj \
    ack \
    bleachbit \
    build-essential \
    ca-certificates \
    cabextract \
    checkinstall \
    compizconfig-settings-manager \
    curl \
    faac \
    faad \
    ffmpeg2theora \
    file-roller \
    flac \
    gconf-service \
    gconf-service-backend \
    gconf2-common \
    gimp \
    gimp-data \
    gimp-data-extras \
    gimp-plugin-registry \
    git \
    git-gui \
    gnupg \
    icedax \
    id3v2 \
    lame \
    liba52-dev \
    libappindicator1 \
    libatk1.0-dev \
    libc++1 \
    libc++1-13 \
    libc++abi1-13 \
    libcairo2-dev \
    libedit-dev \
    libgconf-2-4 \
    libgtk2.0-dev \
    libjpeg-progs \
    libmad0 \
    libmpeg2-4 \
    libncurses5-dev \
    libperl-dev \
    libreoffice-style-sifr \
    libunwind-13 \
    libx11-dev \
    libxpm-dev \
    libxt-dev \
    lsb \
    lsb-release \
    lua5.1 \
    luajit \
    meld \
    mencoder \
    mpack \
    mpeg2dec \
    mpeg3-utils \
    mpegdemux \
    mpg123 \
    mpg321 \
    p7zip-full \
    p7zip-rar \
    python3-dev \
    python3-pip \
    rar \
    ruby-dev \
    sharutils \
    shellcheck \
    ubuntu-restricted-extras \
    unace \
    unrar \
    unzip \
    uudeview \
    uudeview \
    vorbis-tools \
    zip \
    --yes

# docker engine
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io --yes

sudo pip3 install \
    pip \
    black \
    ipdb \
    requests \
    --upgrade

sudo apt update --yes
sudo apt autoremove --yes

sudo groupadd docker
sudo usermod -aG docker "$USER"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
pyenv update

echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> "$HOME/.bashrc"
echo 'eval "$(pyenv init --path)"' >> "$HOME/.bashrc"
echo 'eval "$(pyenv virtualenv-init -)"' >> "$HOME/.bashrc"

curl -sS https://webinstall.dev/nerdfont | bash
