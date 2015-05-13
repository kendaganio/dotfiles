#!/bin/bash

echo "Copying configurations.."

ln -s `pwd`/vimrc ~/.vimrc
ln -s `pwd`/vim ~/.vim

echo "All done!"
