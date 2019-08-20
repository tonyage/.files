execute pathogen#infect()
execute pathogen#helptags()
let mapleader=","

filetype plugin indent on
syntax enable 
set nocompatible

if has('nvim')
	set termguicolors
endif

" Search stuff
set updatetime=100
set path+=**
set incsearch
set hlsearch
set ignorecase
set smartcase 
set tags=tags;/
set rtp+=/usr/local/opt/fzf

" vim directories
set autochdir
set backupdir=~/.vim/backup//
set swapfile!
set undodir=~/.vim/undo//

set wrap
set ruler
set hidden
set number
set showcmd
set wildmenu
set showmatch
set linebreak
set cursorline
set virtualedit=block
set wildmode=list:longest,full 

set lazyredraw
set regexpengine=1

" indents/formats
set list listchars=tab:\|\ 
set encoding=utf-8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set backspace=indent,eol,start
set pastetoggle=<F9>
set clipboard+=unnamedplus
set cmdheight=2
set shortmess+=c

" Folding
set foldmethod=syntax
set foldlevelstart=99
