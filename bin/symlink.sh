#!/bin/bash

DIR="$HOME/.file"
dotfiles=(.vim .vimrc .zshrc .gitconfig .tmux.conf .p10k.zsh .ctags)

mkdir ~/.config > /dev/null 2>&1

for r in "${dotfiles[@]}"; do
	rm -rf $HOME/$r
done

for d in "${dotfiles[@]}"; do
	ln -s $DIR/$d ~/$d > /dev/null 2>&1
	if [ $d == ${dotfiles[0]} ]; then
		ln -s $DIR/$d ~/.config/nvim > /dev/null 2>&1
	fi
done

# function to test symlink quality
symcheck() {
	file=$1
	if [ -L $file ]; then
		if [ -e $file ]; then
			echo "${file##*/} symlink is functional"
		else
			echo "${file##*/} link broken"
		fi
	elif [ -e $file ]; then
		echo "Not a valid symlink"
	else
		echo "${file##*/} is missing"
	fi
}

file=(~/.vim ~/.vimrc ~/.zshrc ~/.gitconfig ~/.tmux.conf ~/.p10k.zsh ~/.ctags ~/.config/nvim)
for f in "${file[@]}"; do
	symcheck $f
done
