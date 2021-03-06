#!/bin/bash

readonly OS=$(lsb_release -si)
readonly BIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
if [[ "$(</proc/version)" == "[Mm]icrosoft" ]] 2>/dev/null; then
    readonly WSL=1
else 
    readonly WSL=0
fi

install_packages() {
    local packages=(build-essential curl httpie tmux ripgrep neovim nodejs yarn)
    if (( WSL )); then
        packages+=(dbus-x11)
    fi
    case "$OS" in
        *Ubuntu*)
            package_manager="apt install -y"	
            sudo apt-get update
            sudo add-apt-repository ppa:neovim-ppa/stable
            sudo $package_manager neovim
            sudo $package_manager ${packages[@]}
            sudo apt autoremove -y
            sudo apt autoclean
            ;;
        *ManjaroLinux*)
            package_manager="pacman -S --noconfirm"
            sudo pacman -Syu
            sudo $package_manager ${packages[@]}
            sudo pacman -QDtq | pacman -Rs -
            sudo pacman -Sc
            ;;
        *) exit 1
    esac
}

install_rust() {
    # rust 
    ! command -v rustup &>/dev/null || return 0
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    sudo $package_manager bat exa
    export PATH="$HOME/.cargo/bin:$PATH"
}

install_pyenv() {
    ! command -v pyenv &>/dev/null || return 0
    # pyenv and pyenv-virtualenv
    curl https://pyenv.run | bash
    if [ -x $(command -v pyenv) ]; then
        git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
    fi
}

install_zsh() {
    rm -rf $HOME/.config/.files/oh-my-zsh
    sudo $package_manager zsh
    export ZSH="$HOME/.config/.files/oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    sudo chsh -s /bin/zsh
    export SHELL=/bin/zsh
}

fix_clock() {
  (( !WSL )) || return 0
  timedatectl set-local-rtc 1 --adjust-system-clock
}

printf "OS Detected: $os_name\n"
printf "Installing defaults...\n"

install_packages
install_rustup
install_pyenv
install_zsh
fix_clock


printf "Installing symlinks and zsh custom plugins..."
/bin/bash $BIN_DIR/symlink.sh
/bin/bash $BIN_DIR/plugin.sh
printf "Remember to set patched font. MesloLGS NF is really good (https://github.com/romkatv/powerlevel10k#fonts)"
exec $SHELL
