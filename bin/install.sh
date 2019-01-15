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

if [ ! -f $HOME/.vimrc &&! -f $HOME/.zshrc && ! -f $HOME/.bashrc ]; then
	ln -s $HOME/.file/.vimrc $HOME/.vimrc
	ln -s $HOME/.file/.zshrc $HOME/.zshrc
	ln -s $HOME/.file/.bashrc $HOME/.bashrc
	ln -s $HOME/.file/.gitconfig $HOME/.gitconfig
fi

if [ ! -d $HOME/.vim && ! -d $HOME/.config ]; then
	ln -s $HOME/.file/.vim $HOME/.vim
	ln -s $HOME/.file/.vim $HOME/.config/nvim
	ln -s $HOME/.file/.config/powerline $HOME/.config/powerline
fi


cd ~/.file/.vim
mkdir backup undo
echo "creating backup directory ~/.file/.vim/backup"
echo "creating undo directory ~/.file/.vim/undo"

cd ~/.file/.vim/bundle/youcompleteme 
git submodule update --init --recursive 
python3 install.py --clang-completer

# oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.file/oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/chrissicool/zsh-256color ~/.file/oh-my-zsh/custom/plugins/zsh-256color
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.file/oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/hlissner/zsh-autopair ~/.file/oh-my-zsh/custom/plugins/zsh-autopair

# powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.file/oh-my-zsh/custom/themes/powerlevel9k
echo "youcompleteme submodule updated and installed\n"
echo "If you're on Linux, set terminal font to patched font!!\n"
echo "If you're on macOS remember to install the patched SF Mono font its stored in Documents!!\n"
