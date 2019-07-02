if has('win32')
	nmap <silent> <leader>lc :cgete system('python .\compile.py ' . expand('%:p'))<CR>:cope<CR>
endif

"vmap <silent> <Leader>fc :Align \h\w*\s*[[(;=]\p*<CR>:1,$s/ *\n/\r/<CR>:noh<CR>Gdd<CR>
