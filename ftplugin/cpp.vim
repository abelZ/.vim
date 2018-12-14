if has('win32')
	nmap <silent> <leader>lc :cgete system('python .\compile.py ' . expand('%:p'))<CR>:cope<CR>
else
	nmap <leader>lc :YcmForceCompileAndDiagnostics<CR>
endif

"--languageclient options-- 
if languageclient == 1
	nnoremap <silent> <leader>gm :call LanguageClient_contextMenu()<CR>
	nnoremap <silent> <leader>fd :call LanguageClient#textDocument_definition()<CR>
	if has('win32')
		nnoremap <silent> <leader>fr :call LanguageClient#textDocument_references()<CR>:lopen<CR>
		nnoremap <silent> <leader>fc :call LanguageClient#cquery_callers()<CR>:lopen<CR>
	else
		nnoremap <silent> <leader>fr :call LanguageClient#textDocument_references()<CR>
		nnoremap <silent> <leader>fc :call LanguageClient#cquery_callers()<CR>
	endif
endif

"vmap <silent> <Leader>fc :Align \h\w*\s*[[(;=]\p*<CR>:1,$s/ *\n/\r/<CR>:noh<CR>Gdd<CR>
