
"****** [ Sass Filetypes ] ******

autocmd BufWritePost  *.scss :call CompileSass() 

function! CompileSass()
	if executable("sass") && filereadable("Makefile")
		!make
	endif
endfunc

"***** [ Sass Filetypes ] *****
