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

inoremap <A-h> <Left>
inoremap <A-l> <Right>

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
nnoremap <silent> <c-space> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gj <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gn <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gk <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gtd <cmd>lua vim.lsp.buf.type_definition()<CR>

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <silent> <C-p> <Plug>(completion_trigger)
