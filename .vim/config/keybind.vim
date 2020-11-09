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


nmap <leader>t :TagbarToggle<CR>
map <leader>n :NERDTreeToggle<CR>

" coc tab mapping
nnoremap <silent> <space>c :<C-u>CocList diagnostics<CR>

inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>":
			\ <SID>check_back_space() ? "\<TAB>":
            \ coc#refresh()
inoremap <expr><S-TAB> 
            \ pumvisible() ? "\<C-p>":
            \ "\<C-h>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gk :call <SID>show_documentation()<CR>
" nmap <silent> gn <Plug>(coc-rename)
nmap <silent> gn :Semshi rename<CR>

inoremap <A-h> <Left>
inoremap <A-l> <Right>

inoremap <silent><expr> <c-space> coc#refresh()

function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

imap <C-j> <Plug>(coc-snippets-expand)
let g:coc_snippet_next='<c-j>'
let g:coc_snippet_prev='<c-k>'

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

autocmd FileType rust nmap <buffer><silent> <F1> :Crun<CR>
autocmd FileType markdown.pandoc nmap <buffer><silent> <F1> :ComposerStart<CR>
autocmd FileType python nmap <buffer><silent> <F1> :vert term ipython3<CR>

nnoremap <silent><TAB> :bn<CR>
nnoremap <silent><S-TAB> :bp<CR>
nnoremap <silent><leader><TAB> :tn<CR>

" nvim-lsp bindings
" nnoremap <silent> gd <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> gj <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> gn <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> gk <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> gt <cmd>lua vim.lsp.buf.type_definition()<CR>
