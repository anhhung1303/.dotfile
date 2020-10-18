#!/usr/bin/env bash

dir=`pwd`
echo $dir

ln -s $dir/tmux.conf ~/.tmux.conf
ln -s $dir/zshrc ~/.zshrc
ln -s $dir/config ~/.config
