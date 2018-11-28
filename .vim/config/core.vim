execute pathogen#infect()
execute pathogen#helptags()
let mapleader=","

filetype plugin indent on
syntax enable 
set nocompatible

if has('nvim')
	if has('termguicolors')
		set termguicolors
	endif
	"let g:enable_ycm_at_startup=1
endif

set updatetime=100
set path+=**
set incsearch
set hlsearch
set ignorecase
set smartcase 

set autochdir
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set wrap
set ruler
set number
set showcmd
set wildmenu
set showmatch
set cursorline
set wildmode=list:longest 

set encoding=utf-8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set backspace=indent,eol,start

" list errors and warnings for current file
nmap <leader>e :Errors<CR>

" normal mode keybinds
nnoremap <C-e> 10<C-e>
nnoremap <C-y> 10<C-y>
nnoremap <leader>/ :nohl<CR>

" insert mode keybinds
imap <F12> <C-W>
