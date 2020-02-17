# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#  Path to oh-my-zsh installation
export ZSH="$HOME/.file/oh-my-zsh"
export ZSH_COMPDUMP="/tmp/zcompdump-$USER"

# locale settings
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Vagrant default provider
export VAGRANT_DEFAULT_PROVIDER='virtualbox'

# Path to vim files
export MYVIMRC="$HOME/.vimrc"
export VIMINIT="source $MYVIMRC"

# Path to go source
export GOPATH="$HOME/Code/go"
export GOBIN="$GOPATH/bin"

# pyenv conf
export PYENV_ROOT="$HOME/.pyenv"

# flutter
export flutterRoot="$HOME/Code/flutter"

# powerlevel9k stuff goes here
alias pl9kcs='for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"'

COMPLETION_WAITING_DOTS=false

POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	brew
    cargo
	colored-man-pages
	docker
    docker-compose
    django
    flutter
    fzf
    golang
    gnu-utils
	gradle
    rust
	pip
    pyenv
    pylint
	python
	screen
    systemd
	vagrant
    ubuntu
    yarn
	zsh-256color
	zsh-autopair
    zsh-interactive-cd
	zsh-autosuggestions
	zsh-syntax-highlighting
	history-substring-search
)

source $ZSH/oh-my-zsh.sh

if [ "$(uname -s)" = Linux  ]; then
	alias grep='grep --color=auto'
	export TERM="xterm-256color"
    export JAVA_HOME='/usr/lib/jvm/java-1.8.0-openjdk-amd64'
else
	# make gradle work
	export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_192.jdk/Contents/Home'
	alias finder='open -a Finder ./'									# opens current file/directory in Finder
fi

tabs 4

# bindings
alias tree='tree -CA'
alias wut='cat ~/.zshrc'												# helpful

if [ -f $(which exa) ]; then
    alias ls='exa'
    alias ll='exa -lah --git --group-directories-first'
    alias tree='exa -T'
else
    alias ls='ls -aH'
    alias ll='ls -laH'
fi

alias ltr='ls -lhtr'													# long list by time ascending
alias lsr='ls -lhSr'													# long list by size ascending
alias ..='cd ../'														# go back 1 directory level
alias ...='cd ../../'													# go back 2 directory levels
alias ....='cd ../../../'												# go back 3 directory levels
alias .....='cd ../../../../'
alias vedit='nvim ~/.file/.vimrc'										# edit .vimrc
alias cedit='nvim ~/.file/.vim/config/core.vim'							# edit core.vim
alias pedit='nvim ~/.file/.vim/config/plugins.vim'						# edit plugins.vim
alias kedit='nvim ~/.file/.vim/config/keybind.vim'
alias aedit='nvim ~/.file/.vim/config/autocmd.vim'
alias zedit='nvim ~/.file/.zshrc'										# edit .bashrc
alias p10edit='nvim ~/.p10k.zsh'
alias psource='source ~/.p10k.zsh'
alias zsource='source ~/.zshrc'											# source .bashrc
alias rip='rm -rf'
alias fvim='nvim -o `fzf`'												# fzf a file and open it in neovim
alias open='xdg-open'
# alias colors='for i in {0..255}; do print -Pn "%K{$i} %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%8)):#7}:+$'\n'}; done'
alias vi='nvim'															# rebind

alias pyenv37='pyenv activate pynvim3'
alias pyenv38='pyenv activate pynvim38'

alias BEGINCOMMENT='if [  ]; then'
alias ENDCOMMENT='fi'

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

for file in ~/.file/zsh_config/*.zsh; do
	source $file
done

# Look for local zshrc -- throw OS/machine specfic stuff there
if [ -f ~/.zshrc_local ]; then
	echo "Sourcing local zshrc"
	source ~/.zshrc_local
fi

if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
	source "${VIRTUAL_ENV}/bin/activate"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ "$(uname -s)" = Linux  ]; then
    export PATH="/usr/local/go/bin:$PYENV_ROOT/bin:$HOME/Code/flutter/bin:/usr/local/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
else
    export PATH="/usr/local/go/bin:$PYENV_ROOT/bin:$HOME/Library/Android/sdk/platform-tools:$HOME/Code/flutter/bin:/usr/local/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.pub-cache/bin:$PATH"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
