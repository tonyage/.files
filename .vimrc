execute pathogen#infect()
execute pathogen#helptags()
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

" syntastic 
set statusline+=%#warningmsg#,%{SyntasticStatuslineFlag()},%*,%{FugitiveStatusline()}
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

" syntax highlighting font style 
highlight Comment cterm=italic
highlight Constant cterm=italic

"let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8f="\<Esc>[48;2;%lu;%lu;%lum"

" vim-airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#syntastic#enabled=1
let g:airline_theme='atomic'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#tabline#buffer_idx_mode=1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3

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

" indent guide
let g:indent_guides_enable_on_vim_startup=1

" ctrl-p
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
	let g:ctrlp_user_command= 'ag %s -l --nocolor -g ""'
	let g:ctrlp_use_caching=0
endif 
