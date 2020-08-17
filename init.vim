if exists('g:vscode')
    " VSCode extensions
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
        silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall
    endif

    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    source $HOME/.config/.files/.vimrc
endif
require'nvim_lsp'.rust_analyzer.setup{}
require'nvim_lsp'.vimls.setup{}
