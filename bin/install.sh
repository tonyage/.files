#!/bin/bash

os_name=$(lsb_release -si)
packages="build-essential curl httpie tmux ripgrep"

printf "OS Detected: $os_name\n"
case "$os_name" in
	*Ubuntu*)
		package_manager="apt install -qy"	
		sudo add-apt-repository ppa:neovim-ppa/stable
        sudo $package_manager neovim
		;;
	*ManjaroLinux*)
		package_manager="pacman -S --noconfirm"
		;;
	*) exit 1
esac


if ! [ -x $(command -v rustup) ]; then
    # rust 
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
elif ! [ -x $(command -v pyenv) ]; then
    # pyenv and pyenv-virtualenv
    curl https://pyenv.run | bash
elif [ -x $(command -v pyenv) ]; then
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
fi


export PATH="$HOME/.cargo/bin:$PATH"
printf "Installing defaults...$packages\n"
sudo $package_manager $packages

read -p "Would you like to use zsh or fish? " ans
case "$ans" in
	*zsh*)
		rm -rf $HOME/.config/.files/oh-my-zsh
		sudo $package_manager zsh
		export ZSH="$HOME/.config/.files/oh-my-zsh"
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
		sudo chsh -s /bin/zsh
		export SHELL=/bin/zsh
		;;
	*fish*)
		sudo apt-add-repository ppa:fish-shell/release-3
		sudo $package_manager fish
		export FISH="$HOME/.config/.files/oh-my-fish"
		echo 'y' | curl -L https://get.oh-my.fish | fish
		echo /usr/local/bin/fish | sudo tee -a /etc/shells
		chsh -s /usr/local/bin/fish
		export SHELL=/usr/local/bin/fish
		;;
	*)
		printf "USAGE: $0 {zsh|fish}"
		exit 1
		;;
esac

printf "Installing symlinks and zsh custom plugins..."
/bin/bash ./symlink.sh
/bin/bash ./plugin.sh
printf "Remember to set patched font. MesloLGS is really good (https://github.com/romkatv/powerlevel10k#fonts)"
exec $SHELL
