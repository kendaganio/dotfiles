#!/bin/bash

echo "Let's start this mofo up!"

ln -sfv `pwd`/gitconfig ~/.gitconfig

ln -sfv `pwd`/gvimrc ~/.gvimrc
ln -sfv `pwd`/vimrc ~/.vimrc
ln -sfv `pwd`/vim ~/.vim

ln -sfv `pwd`/tmux.conf ~/.tmux.conf
ln -sfv `pwd`/tmuxinator ~/.tmuxinator

echo "All done!"
