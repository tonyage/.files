#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	sudo apt install zsh	
	mkdir -p ~/.local/share/fonts
	cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
elif [[ "$(uname)" == "Darwin" ]]; then 
	brew install zsh 
	git clone https://github.com/artofrawr/powerline-fonts.git ~/Documents/powerline-fonts 
fi

export ZSH="$HOME/.file/oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh

git submodule init
git submodule update

./symlink_rc.sh 

cd ~/.file/.vim
mkdir backup swap undo
echo "creating backup directory ~/.file/.vim/backup"
echo "creating swap directory ~/.file/.vim/swap"
echo "creating undo directory ~/.file/.vim/undo"

cd ~/.file/.vim/bundle/youcompleteme 
git submodule update --init --recursive 
python3 install.py --clang-completer

echo "youcompleteme submodule updated and installed\n"
echo "If you're on Linux, set terminal font to patched font!!\n"
echo "If you're on macOS remember to install the patched SF Mono font its stored in Documents!!\n"
