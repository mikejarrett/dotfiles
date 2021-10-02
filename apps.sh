#!/usr/bin/env bash
sudo apt update
sudo apt install --yes \
    apt-transport-https \
    autoconf \
    automake \
    build-essential \
    ca-certificates \
    checkinstall \
    cproto \
    curl \
    file \
    gettext \
    git \
    git-gui \
    gnupg \
    libacl1-dev \
    libatk1.0-dev \
    libcairo2-dev \
    libgpm-dev \
    libgtk-3-dev \
    libgtk2.0-dev \
    liblua5.1-0 \
    liblua5.1-dev \
    liblua5.2-0 \
    liblua5.2-dev \
    libluajit-5.1-dev \
    libncurses-dev \
    libncurses5-dev \
    libperl-dev \
    libtinfo-dev \
    libx11-dev \
    libxmu-dev \
    libxpm-dev \
    libxt-dev \
    lsb-release \
    lua5.1 \
    lua5.2 \
    luajit \
    meld \
    procps \
    python2-dev \
    python3-dev \
    python3-pip \
    readline-doc \
    ruby-dev \
    shellcheck \
    tmux

# vim install
bash ~/dotfiles/vim82-install.sh

# nordvpn
sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)

# # linuxbrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "" >> ~/.profile
echo "# brew" >> ~/.profile
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.profile
source ~/.profile
brew install nvm pyenv rbenv gcc pyenv-virtualenv go nodejs java

echo "" >> ~/.profile
echo "# nvm" >> ~/.profile
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.profile
echo '[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && . "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"' >> ~/.profile
echo "# This loads nvm bash_completion" >> ~/.profile
echo '[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && .  "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"' >> ~/.profile

echo "" >> ~/.profile
echo "# pyenv" >> ~/.profile
echo 'export PATH="~/.pyenv/bin:$PATH"' >> ~/.profile
echo 'eval "$(pyenv init -)"' >> ~/.profile
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.profile

source ~/.profile

pyenv install 3.9.7
pyenv global 3.9.7
npm install --lts
rbenv install 2.7.1

# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install --yes docker-ce docker-ce-cli containerd.io
sudo groupadd docker
sudo usermod -aG docker $USER


# other dev environments
sudo pip3 install \
    black \
    ipdb \
    requests \
    --upgrade

sudo apt update --yes
sudo apt install --fix-broken --yes
sudo apt autoremove --yes

ln -s ~/dotfiles/vim/vimrc ~/.vimrc
ln -s ~/dotfiles/gitconfig ~/.gitconfig

echo "To install YouCompleteMe ..."
echo "Launch vim and let it install all the plugins then exit and run the following..."
echo "cd ~/.vim/dein/repos/github.com/ycm-core/YouCompleteMe/"
echo "python3 install.py --all"
