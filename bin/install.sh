#!/bin/bash

read -p "Would you like to use zsh or fish? " ans
input=${ans,}

if [[ "$input" == "zsh" ]]; then
	if [[ "$(uname)" == "Linux" ]]; then
		if [[ "$(lsb_release -si)" == "Ubuntu" ]]; then
			sudo apt-get install -qy zsh curl tmux
			sudo add-apt-repository ppa:neovim-ppa/stable
			sudo apt-get update
			sudo apt-get install -qy neovim python3-dev python3-pip \
                python-pip libffi-dev tree
			mkdir -p ~/.local/share/fonts
            curl https://pyvenv.run | bash
		elif [[ "$(lsb_release -si)" == "ManjaroLinux" ]]; then
			sudo pacman -S --noconfirm zsh curl tmux
		fi
	elif [[ "$(uname)" == "Darwin" ]]; then
		if [ ! -f "$(which brew)" ]; then
			brew install zsh curl tmux
		fi
	fi

	export ZSH="$HOME/.file/oh-my-zsh"

	if [ ! -d "$ZSH" ]; then
		echo 'y' | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
		sudo chsh -s /bin/zsh
        export SHELL=/bin/zsh
        exec $SHELL
	fi

elif [[ "$input" == "fish" ]]; then
	if [[ "$(uname)" == "Linux" ]]; then
		if [[ "$(lsb_release -si)" == "Ubuntu" ]]; then
			sudo apt-add-repository ppa:fish-shell/release-3
			sudo apt-get update
			sudo apt-get install -qy fish tmux
			mkdir -p ~/.local/share/fonts
	elif [[ "$(uname)" == "Darwin" ]]; then
		if [ ! -f "$(which brew)" ]; then
			brew install fish curl tmux
		fi
	fi

	export FISH="$HOME/.file/oh-my-fish"

	if [ ! -d "$FISH" ]; then
		echo 'y' | curl -L https://get.oh-my.fish | fish
		echo /usr/local/bin/fish | sudo tee -a /etc/shells
		chsh -s /usr/local/bin/fish
        export SHELL=/usr/local/bin/fish
fi

printf "Installing symlinks...\n"
/bin/bash ./symlink.sh
/bin/bash ./plugin.sh
printf "Remember to set your patched font.\n"
