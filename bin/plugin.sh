#!/bin/bash

plugin_dir="$ZSH/custom/plugins"
themes_dir="$ZSH/custom/themes"
urls=("https://github.com/zsh-users/zsh-syntax-highlighting.git"
      "https://github.com/chrissicool/zsh-256color"
      "https://github.com/zsh-users/zsh-autosuggestions"
      "https://github.com/hlissner/zsh-autopair"
      "https://github.com/zsh-users/zsh-history-substring-search.git")

if [ -d "$plugin_dir" ] && [ -d "$themes_dir" ]; then
    printf "installing zsh plugins....\n"
    pushd $plugin_dir > /dev/null
    for url in "${urls[@]}"; do
        git clone $url
    done
    popd > /dev/null

    pushd $themes_dir > /dev/null
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git
    popd > /dev/null
else 
    printf "zsh plugins and/or themes directories not found."
    exit 1
fi
