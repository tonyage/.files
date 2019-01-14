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
