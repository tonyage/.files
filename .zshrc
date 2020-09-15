# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Dotfiles
DIR="$HOME/.config/.files"

#  Path to oh-my-zsh installation
export ZSH="$HOME/.config/.files/oh-my-zsh"
export ZSH_PLUGINS="$ZSH/custom/plugins"
export ZSH_COMPDUMP="/tmp/zcompdump-$USER"

# locale settings
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Vagrant default provider
export VAGRANT_DEFAULT_PROVIDER='virtualbox'

# Path to vim files
export MYVIMRC="$HOME/.vimrc"
export VIMINIT="source $MYVIMRC"
export XDG_CONFIG_HOME="$HOME/.config"

COMPLETION_WAITING_DOTS=false

# powerlevel10k stuff goes here
alias pl9kcs='for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"'
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    cargo
	colored-man-pages
	docker
    docker-compose
    django
    fzf
    golang
    gitignore
    httpie
    jsontools
    ripgrep
    rust
    rustup
	pip
    pyenv
    vagrant
	zsh-256color
	zsh-autopair
	zsh-autosuggestions
	zsh-syntax-highlighting
	history-substring-search
)

source $ZSH/oh-my-zsh.sh
source $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_PLUGINS/zsh-history-substring-search/zsh-history-substring-search.zsh

if [ "$(uname -s)" = Linux  ]; then
	alias grep='grep --color=auto'
	export TERM="xterm-256color"
    export JAVA_HOME='/usr/lib/jvm/java-1.8.0-openjdk-amd64'
fi

tabs 4

# bindings
if [[ -f $(which exa) ]]; then
    alias ls='exa'
    alias ll='exa -lah --git --group-directories-first'
    alias tree='exa -T'
else
    alias ls='ls -aH'
    alias ll='ls -laH'
    alias tree='tree -CA'
fi

alias ..='cd ../'														# go back 1 directory level
alias ...='cd ../../'													    # go back 2 directory levels
alias ....='cd ../../../'												    # go back 3 directory levels
alias .....='cd ../../../../'

alias rip='rm -rf'
alias fvim='nvim -o `fzf`'												    # fzf a file and open it in neovim
alias open='xdg-open'
alias pdel='pyenv deactivate'
alias vi="nvim"

# edit configs
alias vedit='nvim $DIR/.vimrc'										        # edit .vimrc
alias nedit='nvim $DIR/init.vim'
alias cedit='nvim $DIR/.vim/config/core.vim'							    # edit core.vim
alias pedit='nvim $DIR/.vim/config/plugins.vim'						        # edit plugins.vim
alias kedit='nvim $DIR/.vim/config/keybind.vim'
alias aedit='nvim $DIR/.vim/config/autocmd.vim'
alias zedit='nvim $DIR/.zshrc'										        # edit .bashrc
alias p10edit='nvim ~/.p10k.zsh'
alias psource='source ~/.p10k.zsh'
alias zsource='source ~/.zshrc'											    # source .bashrc

alias BEGINCOMMENT='if [  ]; then'
alias ENDCOMMENT='fi'

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

for file in $DIR/zsh_config/*.zsh; do
	source $file
done

# Look for local zshrc -- throw OS/machine specfic stuff there
[ -f ~/.zshrc_local ] && {echo "Sourcing local zshrc"; source ~/.zshrc_local;}

# pyenv-virtualenv support
[[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]] && source "${VIRTUAL_ENV}/bin/activate"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
