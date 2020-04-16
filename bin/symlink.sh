#!/bin/bash

DIR="$HOME/.file"
CONF_DIR="$HOME/.config/nvim"
dotfiles=(.vim .vimrc .zshrc .gitconfig .tmux.conf .p10k.zsh .ctags onedark.colorscheme)

mkdir ~/.config > /dev/null 2>&1

for r in "${dotfiles[@]}"; do
	rm -rf $HOME/$r
done

for d in "${dotfiles[@]}"; do
	if [ $d == ${dotfiles[0]} ]; then
        ln -s $DIR/$d $CONF_DIR > /dev/null 2>&1
        ln -s $DIR/init.vim ~/.config/nvim/init.vim > /dev/null 2>&1
        continue
    elif [ $d == ${dotfiles[7]} ]; then
        echo $DIR/term_config/$d
        ln -s $DIR/term_config/$d ~/.local/share/konsole/$d 
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

file=(~/.vimrc ~/.zshrc ~/.gitconfig ~/.tmux.conf ~/.p10k.zsh ~/.ctags $CONF_DIR $CONF_DIR/init.vim)
for f in "${file[@]}"; do
	symcheck $f
done
