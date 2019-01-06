if has("autocmd")
	augroup vimrcEx
		au!
		au FileType c   if glob('Makefile') == "" | let &mp = "gcc -o %< %" | endif
		au FileType cpp if glob('Makefile') == "" | let &mp = "gcc -o %< %" | endif
	augroup END
endif
