#!/bin/bash

DIR="$HOME/.file"
dotfiles=($DIR/.vim $DIR/.vimrc $DIR/.zshrc $DIR/.gitconfig)

mkdir ~/.config > /dev/null 2>&1

for d in "${dotfiles[@]}"; do
	ln -s $d ~/$d > /dev/null 2>&1
	if [ $d == ${dotfiles[0]} ]; then 
		ln -s $d ~/.config/nvim 2>&1
	fi
done

# function to test symlink quality
symcheck() {
	file=$1
	if [ -L $file ]; then
		if [ -e $file ]; then
			echo "$file symlink is functional"
		else
			echo "$file link broken"
		fi
	elif [ -e $file ]; then
		echo "Not a valid symlink"
	else 
		echo "$file is missing"
	fi
}

file=(~/.vim ~/.vimrc ~/.zshrc ~/.gitconfig ~/.config/nvim)
for f in "${file[@]}"; do
	symcheck $f
done
