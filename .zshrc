#  Path to oh-my-zsh installation
export ZSH="$HOME/.file/oh-my-zsh"

# locale settings
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Vagrant default provider
export VAGRANT_DEFAULT_PROVIDER='virtualbox'

#  Path to vim files
export MYVIMRC="$HOME/.vimrc"
export VIMINIT="source $MYVIMRC"


# powerlevel9k stuff goes here
alias pl9kcs='for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"'

POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel9k/powerlevel9k"
COMPLETION_WAITING_DOTS="true"

POWERLEVEL9K_TIME_12HR=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator user virtualenv dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time time)
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='075'
POWERLEVEL9K_DIR_HOME_BACKGROUND='075'
POWERLEVEL9K_OS_ICON_FOREGROUND='069'
POWERLEVEL9K_OS_ICON_BACKGROUND='231'
POWERLEVEL9K_USER_FOREGROUND='153'
POWERLEVEL9K_USER_BACKGROUND='195'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_TIME_FOREGROUND='black'
POWERLEVEL9K_TIME_BACKGROUND='231'
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M  %m.%d}"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

plugins=(
	autopep8
	brew
	colored-man-pages
	docker
	git
	gradle
	pep8
	pip
	python
	screen
	tmux
	vagrant
	web-search
	zsh-256color
	zsh-autopair
	zsh-autosuggestions
	zsh-syntax-highlighting 
	history-substring-search
)

source $ZSH/oh-my-zsh.sh

if [ "$(uname -s)" = Linux  ]; then 
	alias grep='grep --color=auto'
	export TERM="xterm-256color"
else	
	# make gradle work
	export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_192.jdk/Contents/Home'
	
	alias ls='ls -G'
	alias finder='open -a Finder ./'									# opens current file/directory in Finder
fi

tabs 4

# bindings
alias tree='tree -CA'
alias wut='cat ~/.zshrc'												# helpful
alias ll='ls -lah'														# long list shows all permissions and hidden files
alias la='ls -ah'														# list all hidden files human readable
alias ltr='ls -lhtr'													# long list by time ascending
alias lsr='ls -lhSr'													# long list by size ascending
alias ..='cd ../'														# go back 1 directory level
alias ...='cd ../../'													# go back 2 directory levels
alias ....='cd ../../../'												# go back 3 directory levels
alias .....='cd ../../../../'
alias vedit='nvim ~/.file/.vimrc'										# edit .vimrc
alias cedit='nvim ~/.file/.vim/config/core.vim'							# edit core.vim
alias pedit='nvim ~/.file/.vim/config/plugins.vim'						# edit plugins.vim
alias zedit='nvim ~/.file/.zshrc'										# edit .bashrc
alias zsource='source ~/.zshrc'											# source .bashrc
alias df='df -h'														# human readable disk
alias rip='rm -rf "$1"'
alias pyenv3='pyenv activate pynvim3'

alias BEGINCOMMENT='if [  ]; then'
alias ENDCOMMENT='fi'

# macOS specific
alias finder='open -a Finder ./'										# opens current file/directory in Finder
alias out='tee ~/Desktop/termOut.txt'									# pipe content to output file on desktop

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# quality of life
mkcd() {																# makes directory and enters it
	mkdir -p "$@" && cd "$@"
}
cdls() {																# changes directory and lists contents 
	cd "$@" && ls           
}
cdll() {
	cd "$@" && ll
}

for file in ~/.file/shell-config/*.zsh; do
	source $file 
done

# Look for local zshrc -- throw OS/machine specfic stuff there
if [ -f ~/.zshrc_local ]; then
	echo "Sourcing local zshrc"
	source ~/.zshrc_local
fi 

export PATH="/home/tdo/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
