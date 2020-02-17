#/bin/bash

read -p "Would you like to use zsh or fish? " ans
input=${ans,}

if [[ "$input" == "zsh" ]]; then
	if [[ "$(uname)" == "Linux" ]]; then
		if [[ "$(lsb_release -si)" == "Ubuntu" ]]; then
			sudo add-apt-repository ppa:neovim-ppa/stable
			sudo apt-get update
			sudo apt-get install -qy neovim python3-dev python3-pip \
                python-pip libffi-dev tree zsh curl tmux tree
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
		sudo chsh -s /usr/bin/zsh
        export SHELL=/usr/bin/zsh
	fi

elif [[ "$input" == "fish" ]]; then
	if [[ "$(uname)" == "Linux" ]]; then
		if [[ "$(lsb_release -si)" == "Ubuntu" ]]; then
			sudo apt-add-repository ppa:fish-shell/release-3
			sudo apt-get update
			sudo apt-get install -qy neovim python3-dev python3-pip \
                python-pip libffi-dev tree fish curl tmux tree
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

else
    echo "Choose either zsh or fish, exiting..."
    exit 1
fi

printf "Installing symlinks...\n"
/bin/bash ./symlink.sh
/bin/bash ./plugin.sh
printf "Remember to set your patched font."
exec $SHELL
