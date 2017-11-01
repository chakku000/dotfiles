#!/bin/bash

# install kernel header
# if OS is running on VirtualBox and want to do resize window automatically
# you need linux-headers-generic
function install_kernel_header(){
	sudo apt-get install -y linux-headers-generic
}

# make home directory English
function make_dir_eng() {
	LANG=C xdg-user-dirs-gtk-update
}

# install neovim from apt 
function install_neovim() {
	sudo apt-get install software-properties-common
	sudo add-apt-repository ppa:neovim-ppa/unstable
	sudo apt-get update
	sudo apt-get install neovim
	sudo apt-get install xsel
}

# install zsh
function install_zsh() {
	sudo apt-get install zsh
}

# install git
function install_git() {
	sudo apt-get install git
}

# install my dotfiles
function download_dotfiles() {
	cd ~
	git clone https://github.com/chakku000/dotfiles
}

# extract dotfiles
function extract_dotfiles(){
	ln -s ~/dotfiles/.zshrc ~/.zshrc
	ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
}

# install scala and sbt
function install_scala() {
	echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
	sudo apt-get update
	sudo apt-get install sbt -y
	sudo apt-get install -y scala
}

# install python
function install_python() {
	sudo apt-get install -y python3 
	sudo apt-get install -y python-dev
	sudo apt-get install -y python-pip
	sudo apt-get install -y python3-dev
	sudo apt-get install -y python3-pip
	sudo pip install neovim
	sudo pip3 install neovim
}

#install_kernel_header
#make_dir_eng
#install_neovim
#install_zsh
#install_git
#download_dotfiles
#extract_dotfiles
#install_scala
#install_python
