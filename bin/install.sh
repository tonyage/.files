#!/bin/bash

read -p "Would you like to use zsh or fish? " ans
input=${ans,}

if [[ "$input" == "zsh" ]]; then
	if [[ "$(uname)" == "Linux" ]]; then
		if [[ "$(lsb_release -si)" == "Ubuntu" ]]; then
			sudo apt-get install -qy zsh curl tmux
			mkdir -p ~/.local/share/fonts
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
		chsh -s /bin/zsh
	fi


	################################################################################
	#
	# oh-my-zsh plugins
	#
	################################################################################

	urls=("https://github.com/zsh-users/zsh-syntax-highlighting.git" 
			"https://github.com/chrissicool/zsh-256color" 
			"https://github.com/zsh-users/zsh-autosuggestions" 
			"https://github.com/hlissner/zsh-autopair" 
			"https://github.com/zsh-users/zsh-history-substring-search.git"
			"https://github.com/bhilburn/powerlevel9k.git")

	pushd $ZSH/custom/plugins > /dev/null

	printf "Installing zsh plugins...\n"
	plugins="$ZSH/custom/plugins"

	if [ -d "$plugins" ]; then
		for url in "${urls[@]}"; do
			git clone $url
			printf "${url##*/} is installed\n"
			if [ $url == ${urls[5]} ]; then
				pushd $ZSH/custom/themes 
				git clone $url
				printf "${url##*/} is installed\n"
				popd
			fi
		done
	fi

	popd > /dev/null

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
fi

	################################################################################
	#
	# (neo)vim plugins
	#
	################################################################################
	git submodule init
	git submodule update

	printf "Installing symlinks...\n"
	/bin/bash symlink.sh
	printf "Remember to set your patched font.\n"

	pushd $HOME/.file/.vim > /dev/null

	mkdir backup undo > /dev/null 2>&1
	printf "creating backup directory ~/.file/.vim/backup\n"
	printf "creating undo directory ~/.file/.vim/undo\n"

	cd bundle/youcompleteme

	MARKER="$HOME/.file/.vim/bundle/youcompleteme/ycm_setup_marker"

	if [ -f ${MARKER} ]; then
		exit 0
	fi

	git submodule update --init --recursive 
	python3 install.py --clang-completer
	printf "youcompleteme submodule updated and installed.\n"

	touch ${MARKER}
	popd > /dev/null