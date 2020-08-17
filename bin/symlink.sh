#!/bin/bash
#
# This script can be run multiple times to relink config files

readonly DIR="$HOME/.config/.files"
readonly CONF_DIR="$HOME/.config/nvim"

link_configs() {
    local dotfiles=(init.vim .vimrc .zshrc .gitconfig .tmux.conf .p10k.zsh .ctags)
    [[ -d $CONF_DIR ]] || mkdir -p $CONF_DIR
    for r in "${dotfiles[@]}"; do
        rm -rf $HOME/$r
    done

    for d in "${dotfiles[@]}"; do
        if [ $d == ${dotfiles[0]} ]; then
            ln -s $DIR/$d $CONF_DIR/init.vim > /dev/null 2>&1
            ln -s $DIR/.vim/autoload $CONF_DIR/autoload > /dev/null 2>&1
            ln -s $DIR/.vim/colors $CONF_DIR/colors > /dev/null 2>&1
            continue
        fi
        ln -s $DIR/$d ~/$d > /dev/null 2>&1
    done
}

# alacritty config file
if [[ -f "$HOME/.config/alacritty/alacritty.yml" ]]; then
    rm "$HOME/.config/alacritty/alacritty.yml"
fi
ln -s $DIR/term_config/alacritty.yml $HOME/.config/alacritty/alacritty.yml > /dev/null 2>&1

# function to test symlink quality
symcheck() {
	local file=$1
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

link_configs

# TODO: find out why .vim gets symlinked on itself
if [ -e $DIR/.vim/.vim ]; then
    printf "unlinking .vim...\n"
    unlink $DIR/.vim/.vim
elif [ -e $DIR/.vim/autoload/autoload ]; then
    printf "unlinking .vim/autoload...\n"
    unlink $DIR/.vim/autoload/autoload
fi

file=(
    ~/.vimrc
    ~/.zshrc
    ~/.gitconfig 
    ~/.tmux.conf
    ~/.p10k.zsh
    ~/.ctags
    $CONF_DIR/autoload
    $CONF_DIR/colors
    $CONF_DIR/init.vim
    $DIR/.config/alacritty/alacritty.yml
)
for f in "${file[@]}"; do
	symcheck $f
done
