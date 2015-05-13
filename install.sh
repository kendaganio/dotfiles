#!/bin/bash

echo "Copying configurations.."

ln -s `pwd`/vimrc ~/.vimrc
ln -s `pwd`/gvimrc ~/.gvimrc
ln -s `pwd`/vim ~/.vim

echo "All done!"
