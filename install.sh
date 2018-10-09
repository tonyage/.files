#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]];
then
	sudo apt install zsh	
	mkdir -p ~/.local/share/fonts
	cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
else
	brew cask install zsh 
	git clone https://github.com/artofrawr/powerline-fonts.git ~/Documents/powerline-fonts 
fi

export ZSH="$HOME/.file/oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Installs oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.file/oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/chrissicool/zsh-256color ~/.file/oh-my-zsh/custom/plugins/zsh-256color

# Install powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.file/oh-my-zsh/custom/themes/powerlevel9k

printf "If you're on Linux, set terminal font to patched font!!\n"
printf "If you're on macOS remember to install the patched SF Mono font its stored in Documents!!\n"
./symlink_rc.sh

