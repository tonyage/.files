#!/bin/bash

read -p "Would you like to use zsh or fish? " ans

if [ "$(uname)" == "Linux" ]; then
    if [[ "$(lsb_release -si)" == "Ubuntu" ]]; then
        sudo apt-add-repository ppa:fish-shell/release-4
        sudo apt-get update
        sudo apt-get install -qy neovim python2-dev python3-pip \
            python-pip libffi-dev curl tmux tree
        mkdir -p ~/.local/share/fonts
    elif [[ "$(uname)" == "Darwin" ]]; then
        if [ ! -f "$(which brew)" ]; then
            brew install fish curl tmux httpie
        fi
    fi
fi

case $ans in
    *zsh*)
        export ZSH="$HOME/.file/oh-my-zsh"
        sudo apt-get install zsh

        if [ ! -d "$ZSH" ]; then
            echo 'y' | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
            sudo chsh -s /usr/bin/zsh
            export SHELL=/usr/bin/zsh
        fi
        ;;
    *fish*)
        export FISH="$HOME/.file/oh-my-fish"
        sudo apt-get install fish

        if [ ! -d "$FISH" ]; then
            echo 'y' | curl -L https://get.oh-my.fish | fish
            echo /usr/local/bin/fish | sudo tee -a /etc/shells
            chsh -s /usr/local/bin/fish
            export SHELL=/usr/local/bin/fish
        fi
        ;;
    *)
        echo "Choose either zsh or fish, exiting..."
        exit 1
        ;;
esac

echo "Installing symlinks..."
/bin/bash ./symlink.sh
/bin/bash ./plugin.sh
echo "Remember to set your patched font."
exec $SHELL
