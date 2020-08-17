if has("autocmd")
	augroup vimrcEx
		au!
		au FileType c   if glob('Makefile') == "" | let &mp = "gcc -o %< %" | endif
		au FileType cpp if glob('Makefile') == "" | let &mp = "gcc -o %< %" | endif
	augroup END
endif

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc textwidth=80

augroup vagrant
	au!
	au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

au FileType json autocmd BufWritePre <buffer> %!python -m json.tool 2>/dev/null
au FileType json syntax match Comment +\/\/.\+$+

" yaml
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" rust
au BufReadPost *.rs setlocal filetype=rust
au FileType rust let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>'})

augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/2
augroup END

au BufWinEnter * let &foldlevel=max(map(range(1, line('$')), 'foldlevel(v:val)'))

" au CursorHold * silent call CocActionAsync('highlight')
