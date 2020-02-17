#!/bin/bash

DIR="$HOME/.file"
dotfiles=(.vim .vimrc .zshrc .gitconfig .tmux.conf .p10k.zsh .ctags)

mkdir ~/.config > /dev/null 2>&1

for r in "${dotfiles[@]}"; do
	rm -rf $HOME/$r
done

for d in "${dotfiles[@]}"; do
	if [ $d == ${dotfiles[0]} ]; then
        ln -s $DIR/$d ~/.config/nvim > /dev/null 2>&1
        ln -s $DIR/init.vim ~/.config/nvim/init.vim > /dev/null 2>&1
	fi
	ln -s $DIR/$d ~/$d > /dev/null 2>&1
done

# TODO: find out why .vim gets symlinked on itself
if [ -e $DIR/.vim/.vim ]; then
    unlink $DIR/.vim/.vim
fi

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

file=(~/.vim ~/.vimrc ~/.zshrc ~/.gitconfig ~/.tmux.conf ~/.p10k.zsh ~/.ctags ~/.config/nvim ~/.config/nvim/init.vim)
for f in "${file[@]}"; do
	symcheck $f
done
