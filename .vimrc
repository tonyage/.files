execute pathogen#infect()
let mapleader=","

filetype plugin indent on
syntax enable 
set nocompatible

set updatetime=100
set path+=**
set incsearch
set hlsearch
set ignorecase
set smartcase 
nnoremap <leader>/ :nohl<CR>

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

" keybinds
nnoremap <C-e> 10<C-e>
nnoremap <C-y> 10<C-y>

" syntastic 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_signs=0

" solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
colorscheme solarized

" vim-airline
let g:airline#extensions#tabline#enabled=1  
let g:airline_theme='solarized'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#fnamemod=1
let g:airline#extensions#tabline#buffer_idx_mode=1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols - defaults to this for non patched fonts
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols - defaults to this for patched fonts
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" enable folding
set foldmethod=indent
set foldlevel=99

" youcompleteme
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
autocmd FileType c nnoremap gd :YcmCompleter GoTo<CR>
autocmd FileType cpp nnoremap gd :YcmCompleter GoTo<CR>

" NERDTree
map <leader>r :NERDTreeToggle<CR>
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDCommenter
let g:NERDSpaceDelims=1			" Add spaces after comment delimters 
let g:NERDCompactSexyComs=1		" Use compact syntax for prettifed multi-line comments
let g:NERDDefaultAlign='left'	" Comments ignore code indentation
let g:NERDCommentEmptyLines=1	
let g:NERDTrimTrailingWhitespace=1 
let g:NERDToggleCheckAllLines=1
