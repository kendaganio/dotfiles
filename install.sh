#!/bin/bash

echo "Let's start this mofo up!"

ln -sv `pwd`/vimrc ~/.vimrc
ln -sv `pwd`/gvimrc ~/.gvimrc
ln -sv `pwd`/vim ~/.vim
ln -sv `pwd`/tmux.conf ~/.tmux.conf
ln -sv `pwd`/tmuxinator ~/.tmuxinator
ln -sv `pwd`/gitconfig ~/.gitconfig
ln -sv `pwd`/config/ranger ~/.config

echo "All done!"
