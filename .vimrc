for file in split(glob('$HOME/.file/.vim/config/*.vim'), '\n')
	execute 'source' file
endfor
