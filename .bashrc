#!/bin/bash
export MYVIMRC="$HOME/.file/.vimrc"
export VIMINIT="source $MYVIMRC"
export PATH="/usr/local/bin:$PATH"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_192.jdk/Contents/Home"
if [[ "$OSTYPE" == "linux-gnu" ]];
then											# check if on linux set colors or macOS set colors
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
else
	alias ls='ls -G'
	alias finder='open -a Finder ./'			# opens current file/directory in Finder
	alias out='tee ~/Desktop/termOut.txt'		# pipe content to output file on desktop
fi

shopt -s checkwinsize

tabs 4
# bindings
alias wut='cat ~/.bashrc'						# helpful
alias ll='ls -lah'								# long list shows all permissions and hidden files
alias la='ls -ah'								# list all hidden files human readable
alias ..='cd ../'								# go back 1 directory level
alias ...='cd ../../'							# go back 2 directory levels
alias ....='cd ../../../'						# go back 3 directory levels
alias .....='cd ../../../../'
alias vedit='vim ~/.file/.vimrc'				# edit .vimrc
alias pedit='vim ~/.file/.vim/config/plugins.vim'
alias cedit='vim ~/.file/.vim/config/core.vim'
alias bedit='vim ~/.file/.bashrc'				# edit .bashrc
alias bsource='source ~/.bashrc'				# source .bashrc
alias df='df -h'								# human readable disk
alias rip='rm -rf "$1"'

# macOS specific
alias finder='open -a Finder ./'				# opens current file/directory in Finder
alias out='tee ~/Desktop/termOut.txt'			# pipe content to output file on desktop

# quality of life
function mkcd() {								# makes directory and enters it
	mkdir -p "$@" && cd "$@"
}
function cdls() {								# changes directory and lists contents 
	cd "$@" && ls			
}

# powerline 
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
