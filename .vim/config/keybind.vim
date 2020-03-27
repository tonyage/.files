" normal mode keybinds
nnoremap <leader>/ :nohl<CR>
nnoremap <leader>z :vsplit<Space>
nnoremap <leader>x :split<Space>

" visual mode keybinds
vnoremap > >gv
vnoremap < <gv

" copy-paste
noremap <leader>y "*y
noremap <leader>p "*p
noremap <leader>Y "+y
noremap <leader>P "+p

" pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <silent> <space>c :<C-u>CocList diagnostics<CR>

nmap <leader>t :TagbarToggle<CR>

" coc tab mapping
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>":
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gf <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

imap <C-j> <Plug>(coc-snippets-expand)
let g:coc_snippet_next='<c-j>'
let g:coc_snippet_prev='<c-k>'

" semshi
nmap <silent> <TAB> :Semshi goto name next<CR>
nmap <silent> <S-TAB> :Semshi goto name prev<CR>

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
