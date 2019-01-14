syntax on 

if has('nvim') 
	colo space-vim-dark

	" enables transparent background; disable for conventional spacemacs theme
	if $TERM_PROGRAM =~ 'iTerm'
		hi Normal ctermbg=NONE guibg=NONE
		hi LineNr ctermbg=NONE guibg=NONE
		hi SignColumn ctermbg=NONE guibg=NONE
	endif
	

	" neovim
	let g:syntastic_mode_map={'mode':'passive'}
	let g:syntastic_check_on_wq=0
	
	call neomake#configure#automake('nrwi',500)
	" call neomake#configure#automake('w')
	let g:neomake_open_list=2
	let g:neomake_list_height=10
	let g:neomake_python_enabled_markers=['python', 'pylama']
	" :Neomake - file marker
	" :Neomake! - project marker
	" :lwindow / :lopen
	" :lprev / :lnext 
	let g:airline_theme='base16_spacemacs'
else
	if has("termguicolors")
		set termguicolors
		let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
		let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	endif

	if (has("autocmd") && !has("gui_running"))
		augroup colors
			autocmd!
			let s:background = {"gui": "#202020", "cterm": "235", "cterm16": "0"}
			autocmd ColorScheme * call onedark#set_highlight("Normal", {"bg": s:background })
		augroup END
	endif

	colorscheme onedark
	let g:airline_theme='onedark'
	let g:onedark_termcolors=256
endif

" syntax highlighting font style 
hi Comment cterm=italic
hi String cterm=italic gui=italic

" vim-airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#syntastic#enabled=1
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

" javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)

nmap <F5> <Plug>(JavaComplete-Imports-AddMissing)
imap <F5> <Plug>(JavaComplete-Imports-AddMissing)

nmap <F6> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F6> <Plug>(JavaComplete-Imports-RemoveUnused)

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

" ctrl-p
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
	let g:ctrlp_user_command= 'ag %s -l --nocolor -g ""'
	let g:ctrlp_use_caching=0
endif
let g:ctrlp_show_hidden=1

" Syntastic
set statusline+=%#warningmsg#,%{SyntasticStatuslineFlag()},%*,%{FugitiveStatusline()}
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_c_checkers=['make']
let g:syntastic_python_checkers=['python', 'pylama', 'pylint']
let g:syntastic_aggregate_errors=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_signs=0

" Tagbar
nmap <leader>t :TagbarToggle<CR>
autocmd VimEnter * nested :TagbarOpen

" Tabular
nmap <leader>a= :Tab /=<CR>
vmap <leader>a= :Tab /=<CR>

noremap <Up> <NOP>
noremap <Down> <NOP>
