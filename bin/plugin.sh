#!/bin/bash

urls=("https://github.com/zsh-users/zsh-syntax-highlighting.git"
		"https://github.com/chrissicool/zsh-256color"
		"https://github.com/zsh-users/zsh-autosuggestions"
		"https://github.com/hlissner/zsh-autopair"
		"https://github.com/zsh-users/zsh-history-substring-search.git")
	
pushd $ZSH/custom/plugins > /dev/null
printf "installing zsh plugins....\n"

for url in "${urls[@]}"; do
	git clone $url
done
popd > /dev/null

pushd $ZSH/custom/themes > /dev/null

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git

popd > /dev/null
