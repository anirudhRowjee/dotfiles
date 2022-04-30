#!/bin/bash
# BOOTSTRAP by Anirudh Rowjee
# simple bootstrap script for Ubuntu Derivative machines

sudo apt install tmux

# install GCC, Make, Git
sudo apt install build-essential clang-12 valgrind --install-suggests 

# clone dotfiles
sudo apt install yadm
# yadm clone https://github.com/anirudhRowjee/dotfiles .

# install Python, Rust, Go and Node and Lisp
## Python
sudo apt install python3-pip
sudo pip3 install virtualenv

## Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

## Go
curl https://golang.org/dl/go1.16.7.linux-amd64.tar.gz 
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.16.7.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> .bashrc
## Node
### install nvm for convenient node upgrades
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
### install node thorugh APT
sudo apt install -y nodejs
npm install -g npm@latest

## Lisp
sudo add-apt-repository ppa:plt/racket
sudo apt-get update
sudo apt install racket

# --------------------------------------------------------------------------------


# Setup Docker, Docker-Compose and K8s
## Docker
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io
## Docker-Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
## Kubernetes (kubectl)
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
## Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb

# --------------------------------------------------------------------------------

### # install vim-plug
### sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
### # install nvim 0.5.0
### curl -L https://github.com/neovim/neovim/releases/download/v0.5.0/nvim.appimage --output nvim.appimage
### sudo chmod +x nvim.appimage
### ./nvim.appimage +PlugInstall

# install i3-gaps and related libraries

# Compton
# sudo apt install compton

## i3-gaps
sudo add-apt-repository ppa:regolith-linux/release
sudo apt update
sudo apt install i3-gaps

## Rofi
sudo apt install rofi

## Zathura
sudo apt install zathura

## Ranger
pip3 install ranger
 

# # install wallpapers
# git clone https://github.com/anirudhRowjee/wallpapers ~/Pictures/wallpapers
# 
# # Download Iosevka from https://www.nerdfonts.com/font-downloads before this
# # setup fonts (Iosevka)
# sudo apt install unzip
# sudo mkdir /usr/share/fonts/truetype/
# sudo unzip Iosevka.zip -d /usr/share/fonts/truetype 

