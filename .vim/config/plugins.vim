syntax on
syntax enable

if has('nvim')
    let g:airline_theme='onedark'
    colo onedark
    let g:onedark_terminal_italics = 1

    " syntax highlighting font style
    hi Comment cterm=italic gui=italic guifg=#5C6370 ctermfg=59
    hi String cterm=italic gui=italic
    let g:python3_host_prog='/home/tdo/.pyenv/versions/py39/bin/python3'
endif

" vim-markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" vim-go
let g:go_highlight_structs                = 1
let g:go_highlight_methods                = 1
let g:go_highlight_operators              = 1
let g:go_highlight_build_constraints      = 1
let g:go_highlight_extra_types            = 1
let g:go_highlight_functions              = 1
let g:go_highlight_function_calls         = 1
let g:go_highlight_function_parameters    = 1
let g:go_highlight_types                  = 1
let g:go_highlight_generate_tags          = 1
let g:go_highlight_variable_declarations  = 1
let g:go_highlight_variable_assignments   = 1
let g:go_fold_enable                      = ['block', 'import', 'varconst', 'package_comment']

" vim-airline
let g:airline#extensions#tabline#enabled          = 1
let g:airline_powerline_fonts                     = 1
let g:airline#extensions#tabline#fnamemod         = ':t'
let g:airline#extensions#tabline#buffer_idx_mode  = 1
let g:airline#extensions#coc#enabled              = 1
let g:airline#extensions#tabline#formatter        = 'default'

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols - defaults to this for non patched fonts
let g:airline_left_sep           = '»'
let g:airline_left_sep           = '▶'
let g:airline_right_sep          = '«'
let g:airline_right_sep          = '◀'
let g:airline_symbols.crypt      = '🔒'
let g:airline_symbols.linenr     = '␊'
let g:airline_symbols.linenr     = '␤'
let g:airline_symbols.linenr     = '¶'
let g:airline_symbols.maxlinenr  = '☰'
let g:airline_symbols.maxlinenr  = ''
let g:airline_symbols.branch     = '⎇'
let g:airline_symbols.paste      = 'ρ'
let g:airline_symbols.paste      = 'Þ'
let g:airline_symbols.paste      = '∥'
let g:airline_symbols.spell      = 'Ꞩ'
let g:airline_symbols.notexists  = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols - defaults to this for patched fonts
let g:airline_left_sep         = ''
let g:airline_left_alt_sep     = ''
let g:airline_right_sep        = ''
let g:airline_right_alt_sep    = ''
let g:airline_symbols.branch   = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr   = ''

" vim-markdown-composer
let g:markdown_composer_autostart=0

" ctrl-p
if executable('rg')
	set grepprg=rg\ --color=never
	let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
	let g:ctrlp_use_caching  = 0
endif

" rainbow
let g:rainbow_active = 1

" Tabular
nmap <leader>a :Tab /
vmap <leader>a :Tab /

" vim-devicons
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" gitlab
let g:fugitive_gitlab_domains = ['https://git.kopismobile.org']

" rust
let g:rustfmt_autosave          = 1
let g:rust_clip_command         = 'xclip -selection clipboard'

" vim-markdown-composer
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release --locked
    else
      !cargo build --release --locked --no-default-features --features json-rpc
    endif
  endif
endfunction

let g:gitgutter_grep = 'rg --color=never'

set statusline^=%{FugitiveStatusline()}

call plug#begin('~/.config/nvim/bundle')

    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-dadbod'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-capslock'
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-eunuch'

    Plug 'glts/vim-radical' " number converter, gA, crd, crx, cro, crb - decimal, hex, octa, binary respectively

    Plug 'rust-lang/rust.vim'
    Plug 'mattn/webapi-vim'
    Plug 'cespare/vim-toml'

    Plug 'shumphrey/fugitive-gitlab.vim'
    Plug 'godlygeek/tabular'
    Plug 'airblade/vim-gitgutter'
    Plug 'luochen1990/rainbow'
    Plug 'ryanoasis/vim-devicons'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'Glench/Vim-Jinja2-Syntax'
    Plug 'ap/vim-css-color'
    Plug 'euclio/vim-markdown-composer', {'do': function('BuildComposer')}

    Plug 'joshdick/onedark.vim'
    Plug 'KeitaNakamura/neodark.vim'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

call plug#end()

:lua << EOF
    local nvim_lsp = require'lspconfig'

    local opts = {noremap=true, silent=true}
    
    local on_attach = function(client, bufnr) 
        require('completion').on_attach()

        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

        buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'gk', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', 'gj', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        buf_set_keymap('n', 'grn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
        buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
        buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
        buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

        if client.resolved_capabilities.document_formatting then
            buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        elseif client.resolved_capabilities.document_range_formatting then
            buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        end

        if client.resolved_capabilities.document_highlight then
            vim.api.nvim_exec([[

              hi LspReferenceRead cterm=bold ctermbg=red guibg=#c5c8c6 guifg=#1d1f21
              hi LspReferenceText cterm=bold ctermbg=red guibg=#c5c8c6 guifg=#1d1f21
              hi LspReferenceWrite cterm=bold ctermbg=red guibg=#c5c8c6 guifg=#1d1f21

              augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
              augroup END
            ]], false)
        end
    end

    local servers = {'rust_analyzer', 'sqlls', 'bashls', 'jsonls', 'yamlls', 'vimls', 'pyright'}
    for _, lsp in ipairs(servers) do
        nvim_lsp[lsp].setup{on_attach=on_attach}
    end

    local treesitter = require'nvim-treesitter.configs'.setup {
        ensured_installed = "maintained",
        highlight = {
            enable = true,
        },
    }
EOF
