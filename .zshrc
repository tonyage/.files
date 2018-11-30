#  Path to oh-my-zsh installation
export ZSH="$HOME/.file/oh-my-zsh"

#  Path to vim files
export MYVIMRC="$HOME/.vimrc"
export VIMINIT="source $MYVIMRC"

POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel9k/powerlevel9k"
COMPLETION_WAITING_DOTS="true"

plugins=(
	git
changing zshrc edit alias to reference version controlled rc file instead of symlink
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

if [ "$(uname -s)" = Linux  ]; 
then 
	alias grep='grep --color=auto'
	export TERM="xterm-256color"
else	
	alias ls='ls -G'
	alias finder='open -a Finder ./'									 # opens current file/directory in Finder
	alias out='tee ~/Desktop/termOut.txt'								 # pipe content to output file on desktop
fi

tabs 4

# bindings
alias wut='cat ~/.zshrc'												 # helpful
alias ll='ls -lah'														 # long list shows all permissions and hidden files
alias la='ls -ah'														 # list all hidden files human readable
alias ..='cd ../'														 # go back 1 directory level
alias ...='cd ../../'													 # go back 2 directory levels
alias ....='cd ../../../'												 # go back 3 directory levels
alias .....='cd ../../../../'
alias vedit='vim ~/.file/.vimrc'										 # edit .vimrc
alias cedit='vim ~/.file/.vim/config/core.vim'							 # edit core.vim
alias pedit='vim ~/.file/.vim/config/plugins.vim'						 # edit plugins.vim
alias zedit='vim ~/.file/.zshrc'										 # edit .bashrc
alias zsource='source ~/.zshrc'											 # source .bashrc
alias df='df -h'														 # human readable disk
alias rip='rm -rf "$1"'

# macOS specific
alias finder='open -a Finder ./'										 # opens current file/directory in Finder
alias out='tee ~/Desktop/termOut.txt'									 # pipe content to output file on desktop

# quality of life
function mkcd() {														 # makes directory and enters it
	mkdir -p "$@" && cd "$@"
}
function cdls() {														 # changes directory and lists contents 
	cd "$@" && ls           
}
function cdll() {
	cd "$@" && ll
}

# POWERLINE9K STUFF GOES HERE
alias pl9kcs='for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"'

POWERLEVEL9K_TIME_12HR=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator user dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status time)
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='075'
POWERLEVEL9K_DIR_HOME_BACKGROUND='075'
POWERLEVEL9K_OS_ICON_FOREGROUND='069'
POWERLEVEL9K_OS_ICON_BACKGROUND='231'
POWERLEVEL9K_USER_FOREGROUND='153'
POWERLEVEL9K_USER_BACKGROUND='195'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M  %m.%d}"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/usr/local/sbin:$PATH"
