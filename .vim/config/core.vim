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
set wildmenu
set wildmode=list:longest,full

" vim directories
set autochdir
set nobackup
set swapfile!
set undodir=~/.vim/undo//

set wrap
set ruler
set hidden
set mouse=nv
set number
set showcmd
set showmatch
set linebreak
set cursorline
set virtualedit=block

set lazyredraw
set regexpengine=1

" indents/formats
set list listchars=tab:\|\ ,extends:#,nbsp:.
set encoding=utf-8
set splitright
set splitbelow
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set signcolumn=yes
set smartindent
set backspace=indent,eol,start
set pastetoggle=<F9>
set clipboard+=unnamedplus
set cmdheight=2

" completion options
set completeopt=menuone,noinsert,noselect
set shortmess+=c

" Folding
set nofoldenable
set foldmethod=manual
set foldlevelstart=99
