nnoremap <leader><leader>g :set operatorfunc=<SID>GrepOperator<CR>g@
vnoremap <leader><leader>g :<c-u>call <SID>GrepOperator(visualmode())<CR>

function! s:GrepOperator(type)
	let saved_unnamed_register = @@

	if a:type ==# 'v'
		normal! `<v`>y
	elseif a:type ==# 'char'
		normal! `[v`]y
	else
		return
	endif

	silent exe "AsyncRun rg --vimgrep -w " . shellescape(@@) . " -t cpp -t c"
	
	let @@ = saved_unnamed_register
endfunction
