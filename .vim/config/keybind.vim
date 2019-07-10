"""" normal mode keybinds
nmap <leader>e :Errors<CR>	" list errors

" moving around
nnoremap <C-e> 10<C-e>
nnoremap <C-y> 10<C-y>
nnoremap <leader>/ :nohl<CR>

" visual mode keybinds
vnoremap > >gv
vnoremap < <gv

" copy-paste
noremap <Leader>c "*y
noremap <Leader>v "*p

" vim-autoformat
noremap <F3> :Autoformat<CR>

" coc tab mappting
" if pop up menu is visible, select first item list otherwise check for
" backspace and re-open autocomplete list, else if item is expandable or
" jumpable send rpc request to generate snippet and jump to it else refresh
" list
inoremap <silent><expr> <TAB>
			\ pumvisible() ? coc#_select_confirm():
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
			\ coc#refresh()

inoremap <silent><expr> <S-TAB>
			\pumvisible() ? "\<C-p>" : "\<S-TAB>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

imap <C-j> <Plug>(coc-snippets-expand)
let g:coc_snippet_next='<TAB>'
let g:coc_snippet_prev='<S-TAB>'
