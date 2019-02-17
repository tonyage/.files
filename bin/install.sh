#!/bin/bash


if [[ "$(lsb_release -si)" == "Ubuntu" ]]; then
	sudo apt-get install -qy neovim vim zsh curl tmux
	mkdir -p ~/.local/share/fonts
	
elif [[ "$(lsb_release -si)" == "ManjaroLinux" ]]; then
	sudo pacman -S --noconfirm neovim vim zsh curl tmux

elif [[ "$(uname)" == "Darwin" ]]; then 
	brew install zsh curl tmux 
fi

export ZSH="$HOME/.file/oh-my-zsh"
rm  ~/.file/oh-my-zsh
echo 'y' | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh

git submodule init
git submodule update

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
