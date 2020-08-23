#!/bin/bash

if [ ! -e $HOME/.alias ]; then
	ln -s $HOME/dotfiles/.alias.sh $HOME/.alias
fi

# nvim setup without plugin
if [ ! -e $HOME/.config/nvim/init.vim ]; then
	ln -s $HOME/dotfiles/no-plug-nvimrc.vim $HOME/.config/nvim/init.vim
fi
