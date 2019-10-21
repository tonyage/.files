"""" normal mode keybinds
nmap <leader>e :Errors<CR>	" list errors
nnoremap <leader>/ :nohl<CR>
nnoremap <leader>z :vsplit<Space>
nnoremap <leader>x :split<Space>

" moving around
nnoremap <C-e> 10<C-e>
nnoremap <C-y> 10<C-y>
nnoremap <silent> <tab>    :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" visual mode keybinds
vnoremap > >gv
vnoremap < <gv

" copy-paste
noremap <leader>c "*y
noremap <leader>v "*p

" pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

cmap w!! w !sudo tee %

nnoremap <silent> <space>c :<C-u>CocList diagnostics<CR>

" coc tab mapping
" if pop up menu is visible, select first item list otherwise check for
" backspace and re-open autocomplete list, else if item is expandable or
" jumpable send rpc request to generate snippet and jump to it else refresh
" list
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>":
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()

nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>f <Plug>(coc-references)

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

imap <C-j> <Plug>(coc-snippets-expand)
let g:coc_snippet_next='<TAB>'
let g:coc_snippet_prev='<S-TAB>'

" semshi
nmap <silent> <leader>rr :Semshi rename<CR>
nmap <silent> <TAB> :Semshi goto name next<CR>
nmap <silent> <S-TAB> :Semshi goto name prev<CR>

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
