if has("autocmd")
	augroup vimrcEx
		au!
		au FileType c   if glob('Makefile') == "" | let &mp = "gcc -o %< %" | endif
		au FileType cpp if glob('Makefile') == "" | let &mp = "gcc -o %< %" | endif
	augroup END
endif

augroup vagrant
	au!
	au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

" pretty print json
autocmd FileType json autocmd BufWritePre <buffer> %!python -m json.tool 2>/dev/null

autocmd FileType json syntax match Comment +\/\/.\+$+
