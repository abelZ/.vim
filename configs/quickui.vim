"======================================================================
"
" menu_init.vim -
"
" Created by abelpzhang on 2022/05/31
"
"======================================================================

so ~/.vim/configs/menu_help.vim

if has('patch-8.1.2292') == 0 && exists('*nvim_open_win') == 0
	finish
endif

call quickui#menu#reset()

call quickui#menu#install("&File", [
			\ [ "&Open\t(:w)", 'call feedkeys(":tabe ")'],
			\ [ "&Save\t(:w)", 'write'],
			\ [ "--", ],
			\ [ "LeaderF &File", 'Leaderf file', 'Open file with leaderf'],
			\ [ "LeaderF &Mru", 'Leaderf mru --regexMode', 'Open recently accessed files'],
			\ [ "LeaderF &Buffer", 'Leaderf buffer', 'List current buffers in leaderf'],
			\ [ "--", ],
			\ [ "J&unk File", 'JunkFile', ''],
			\ ])

if has('win32') || has('win64') || has('win16')
	call quickui#menu#install('&File', [
				\ [ "--", ],
				\ [ "Start &Cmd", 'silent !start /b cmd /C c:\drivers\clink\clink.cmd' ],
				\ [ "Start &PowerShell", 'silent !start powershell.exe' ],
				\ [ "Open &Explore", 'call Show_Explore()' ],
				\ ])
endif

call quickui#menu#install("&File", [
			\ [ "--", ],
			\ [ "E&xit", 'qa' ],
			\ ])

call quickui#menu#install("&Edit", [
			\ ['&Paste Mode', 'set paste!'],
			\ ['Format J&son', '%!python -m json.tool', ''],
			\ ])

call quickui#menu#install('&Symbol', [
			\ [ "&Grep Word\t(In Project)", 'call MenuHelp_GrepCode()', 'Grep keyword in current project' ],
			\ [ "--", ],
			\ [ "Find &Definition\t(GNU Global)", 'call MenuHelp_Gscope("g")', 'GNU Global search g'],
			\ [ "Find &Symbol\t(GNU Global)", 'call MenuHelp_Gscope("s")', 'GNU Gloal search s'],
			\ [ "Find &Called by\t(GNU Global)", 'call MenuHelp_Gscope("d")', 'GNU Global search d'],
			\ [ "Find C&alling\t(GNU Global)", 'call MenuHelp_Gscope("c")', 'GNU Global search c'],
			\ [ "Find &From Ctags\t(GNU Global)", 'call MenuHelp_Gscope("z")', 'GNU Global search c'],
			\ [ "--", ],
			\ [ "Goto D&efinition\t(YCM)", 'YcmCompleter GoToDefinitionElseDeclaration'],
			\ [ "Goto &References\t(YCM)", 'YcmCompleter GoToReferences'],
			\ [ "Get D&oc\t(YCM)", 'YcmCompleter GetDoc'],
			\ [ "Get &Type\t(YCM)", 'YcmCompleter GetTypeImprecise'],
			\ ])

call quickui#menu#install('&Move', [
			\ ["Quickfix &First\t:cfirst", 'cfirst', 'quickfix cursor rewind'],
			\ ["Quickfix L&ast\t:clast", 'clast', 'quickfix cursor to the end'],
			\ ["Quickfix &Next\t:cnext", 'cnext', 'cursor next'],
			\ ["Quickfix &Previous\t:cprev", 'cprev', 'quickfix cursor previous'],
			\ ])

call quickui#menu#install("&Build", [
			\ ["Fast &Compile\tC-F7", 'AsyncTask compile'],
			\ ["Project &Build\tC-F8", 'AsyncTask build'],
			\ ['--', ''],
			\ ["T&ask List\tCtrl+F10", 'call MenuHelp_TaskList()'],
			\ ['E&dit Task', 'AsyncTask -e'],
			\ ['Edit &Global Task', 'AsyncTask -E'],
			\ ['&Stop Building', 'AsyncStop'],
			\ ])

call quickui#menu#install("&Git", [
			\ ['&View Diff', 'call svnhelp#svn_diff("%")'],
			\ ['&Show Log', 'call svnhelp#svn_log("%")'],
			\ ['File &Add', 'call svnhelp#svn_add("%")'],
			\ ['&Blame', 'call ToggleGitLens()'],
			\ ])


if has('win32') || has('win64') || has('win16') || has('win95')
	call quickui#menu#install("&Git", [
				\ ['--',''],
				\ ["Project &Update\t(Tortoise)", 'call svnhelp#tp_update()', 'TortoiseGit / TortoiseSvn'],
				\ ["Project &Commit\t(Tortoise)", 'call svnhelp#tp_commit()', 'TortoiseGit / TortoiseSvn'],
				\ ["Project L&og\t(Tortoise)", 'call svnhelp#tp_log()',  'TortoiseGit / TortoiseSvn'],
				\ ["Project &Diff\t(Tortoise)", 'call svnhelp#tp_diff()', 'TortoiseGit / TortoiseSvn'],
				\ ['--',''],
				\ ["File &Add\t(Tortoise)", 'call svnhelp#tf_add()', 'TortoiseGit / TortoiseSvn'],
				\ ["File &Blame\t(Tortoise)", 'call svnhelp#tf_blame()', 'TortoiseGit / TortoiseSvn'],
				\ ["File Co&mmit\t(Tortoise)", 'call svnhelp#tf_commit()', 'TortoiseGit / TortoiseSvn'],
				\ ["File D&iff\t(Tortoise)", 'call svnhelp#tf_diff()', 'TortoiseGit / TortoiseSvn'],
				\ ["File &Revert\t(Tortoise)", 'call svnhelp#tf_revert()', 'TortoiseGit / TortoiseSvn'],
				\ ["File Lo&g\t(Tortoise)", 'call svnhelp#tf_log()', 'TortoiseGit / TortoiseSvn'],
				\ ])
endif

call quickui#menu#install('&ColorScheme', [
			\ ["&Solarized", 'color solarized'],
			\ ["&Dracula", 'color dracula'],
			\ ["&Gruvbox", 'color gruvbox'],
			\ ["&Molokai", 'color molokai'],
			\ ["&Phd", 'color phd'],
			\ ])

call quickui#menu#install('&CharSet', [
			\ ["&DejaVuSansMono", 'set guifont=DejaVuSansMono_NF:h12'],
			\ ["&FiraCode", 'set guifont=FiraCode_NF:h12'],
			\ ])

call quickui#menu#install('Help (&?)', [
			\ ["&Index", 'tab help index', ''],
			\ ['Ti&ps', 'tab help tips', ''],
			\ ['--',''],
			\ ["&Tutorial", 'tab help tutor', ''],
			\ ['&Quick Reference', 'tab help quickref', ''],
			\ ['&Summary', 'tab help summary', ''],
			\ ['--',''],
			\ ['&Vim Script', 'tab help eval', ''],
			\ ['&Function List', 'tab help function-list', ''],
			\ ['&Dash Help', 'call asclib#utils#dash_ft(&ft, expand("<cword>"))'],
			\ ], 10000)

" let g:quickui_show_tip = 1

function! ShowHexToBinary(mode)
    let l:text = ''
    if a:mode == 'v'
        let l:old_reg = @"
        normal! gvy
        let l:text = @"
        let @" = l:old_reg
    else
        let l:text = expand("<cword>")
    endif

    " Remove whitespace and convert to lowercase
    let l:text = substitute(l:text, '\s', '', 'g')
    let l:text = tolower(l:text)

    " Check if it's a hex value
    if l:text =~ '^0x[0-9a-f]\+$'
        let l:hex = strpart(l:text, 2)
        let l:original = l:text
    elseif l:text =~ '^[0-9a-f]\+$'
        let l:hex = l:text
        let l:original = '0x' . l:text
    else
        echo "Not a valid hex value"
        return
    endif

    " Convert to binary
    let l:decimal = str2nr(l:hex, 16)
    let l:bits = len(l:hex) * 4
    if l:bits < 8
        let l:bits = 8
    endif
    let l:format = '%0' . l:bits . 'b'
    let l:binary = printf(l:format, l:decimal)

    " Format binary with 4-digit groups
    let l:formatted_binary = ""
    let l:i = 0
    while l:i < len(l:binary)
        if l:i > 0 && l:i % 4 == 0
            let l:formatted_binary .= " "
        endif
        let l:formatted_binary .= l:binary[l:i]
        let l:i += 1
    endwhile

    " Create hex digits with spaces for alignment
    let l:hex_spaced = ""
    let l:i = 0
    while l:i < len(l:hex)
        if l:i > 0
            let l:hex_spaced .= "    "  " 4 spaces between hex digits
        endif
        let l:hex_spaced .= l:hex[l:i]
        let l:i += 1
    endwhile

    " Create quickfix entries
    let l:qf_list = [
        \ {'text': '+-- Binary Conversion --+'},
        \ {'text': '| Original: ' . l:original},
        \ {'text': '| Hex:      ' . l:hex_spaced},
        \ {'text': '| Binary:   ' . l:formatted_binary},
        \ {'text': '| Decimal:  ' . l:decimal},
        \ {'text': '+----------------------+'}
        \ ]

    " 0x386d
    " Create quickfix entries
    let l:popup_list = [
        \ '+-- Binary Conversion --+',
        \ '| Original: ' . l:original,
        \ '| Hex:      ' . l:hex_spaced,
        \ '| Binary:   ' . l:formatted_binary,
        \ '| Decimal:  ' . l:decimal,
        \ '+----------------------+'
        \ ]

    let pos = screenpos(win_getid(), line('.'), col('.'))
	let border = ['╭─', '│ ', '╰─']  " Custom border chars
	call popup_create(popup_list, #{
				\ pos: 'topleft',
				\ line: pos.row - len(l:popup_list),
				\ col: pos.col + len(l:text),
				\ border: border,
				\ borderhighlight: ['Comment'],
				\ padding: [0,1,0,1],
                \ moved: 'word',
				\ })

    " Set quickfix list and open it
    " call setqflist(l:qf_list, 'r')
    " below copen 6
    " wincmd p

    " Auto-close after 4 seconds
    " call timer_start(4000, {-> execute('cclose')})
endfunction
" vnoremap <leader>hb :call ShowHexToBinary()<CR>

function! ShowDictionaryPopup(mode)

    let l:text = ''

    " 1. Check the mode and get the appropriate text
    if a:mode == 'v'
        " In Visual mode, get the selected text
        " The '< and '> marks represent the start and end of the last visual selection
        " let l:text = getreg('"')
        let l:old_reg = @"
        normal! gvy
        let l:text = @"
        let @" = l:old_reg
    else
        " In Normal mode, get the word under the cursor
        let l:text = expand('<cword>')
    endif

    " Exit if we have no text
    if empty(trim(l:text))
        return
    endif

    " 2. Build the shell command to call sdcv
    "    -n for non-interactive mode, perfect for scripts
    "    shellescape() is crucial for security and words with special characters
    let command = 'sdcv -n ' . shellescape(l:text)

    " 3. Execute the command and get the result
    let definition = trim(system(command))

    let l:popup_list = split(definition, "\n")
    let pos = screenpos(win_getid(), line('.'), col('.'))
    " 4. If the definition is not empty, show it in a popup
    if !empty(definition)
        call popup_create(l:popup_list, {
                    \ 'line': pos.row - len(l:popup_list) - 4,
                    \ 'col': pos.col + len(l:text),
                    \ 'pos': 'topleft',
                    \ 'wrap': v:true,
                    \ 'padding': [1, 1, 1, 1],
                    \ 'border': [1, 1, 1, 1],
                    \ 'borderchars': ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
                    \ 'highlight': 'PopupTranslate',
                    \ 'moved': 'word',
                    \ 'maxheight': 20
                    \ })
    else
        echo "No definition found for '" . word . "'"
    endif
endfunction

" --- Optional: Define a nice highlight group for the popup ---
highlight default link PopupTranslate Pmenu

"----------------------------------------------------------------------
" context menu
"----------------------------------------------------------------------
let g:context_menu_n = [
			\ ["S&earch in Project\t\\cx", 'exec "silent! Leaderf! rg --no-ignore-vcs -F --stayOpen -w -e " . expand("<cword>")'],
			\ [ "--", ],
			\ [ "Goto D&efinition\t(YCM)", 'YcmCompleter GoToDefinitionElseDeclaration'],
			\ [ "Goto &References\t(YCM)", 'YcmCompleter GoToReferences'],
			\ [ "Get D&oc\t(YCM)", 'YcmCompleter GetDoc'],
			\ [ "Get &Type\t(YCM)", 'YcmCompleter GetTypeImprecise'],
			\ [ "--", ],
			\ ['Cpp&man', 'exec "Cppman " . expand("<cword>")', '', 'c,cpp'],
			\ ['P&ython Doc', 'call quickui#tools#python_help("")', '', 'python'],
			\ [ "--", ],
			\ ["&Hex2Binary", 'call ShowHexToBinary("n")'],
			\ ["Trans&late", 'call ShowDictionaryPopup("n")'],
			\ ]

let g:context_menu_v = [
			\ ["S&earch in Project\t\\cx", 'exec "silent! Leaderf! rg --no-ignore-vcs -F --stayOpen -w -e " . expand("<cword>")'],
			\ [ "--", ],
			\ [ "Goto D&efinition\t(YCM)", 'YcmCompleter GoToDefinitionElseDeclaration'],
			\ [ "Goto &References\t(YCM)", 'YcmCompleter GoToReferences'],
			\ [ "Get D&oc\t(YCM)", 'YcmCompleter GetDoc'],
			\ [ "Get &Type\t(YCM)", 'YcmCompleter GetTypeImprecise'],
			\ [ "--", ],
			\ ['Cpp&man', 'exec "Cppman " . expand("<cword>")', '', 'c,cpp'],
			\ ['P&ython Doc', 'call quickui#tools#python_help("")', '', 'python'],
			\ [ "--", ],
			\ ["&Hex2Binary", 'call ShowHexToBinary("v")'],
			\ ["Trans&late", 'call ShowDictionaryPopup("v")'],
			\ ]

"----------------------------------------------------------------------
" hotkey
"----------------------------------------------------------------------
nnoremap <silent><space><space> :call quickui#menu#open()<cr>

nnoremap <silent>K :call quickui#tools#clever_context('k', g:context_menu_n, {})<cr>
vnoremap <silent>K :call quickui#tools#clever_context('k', g:context_menu_v, {})<cr>

if has('gui_running') || has('nvim')
	noremap <c-f10> :call MenuHelp_TaskList()<cr>
endif
noremap <m-k> :call quickui#preview#scroll(-1)<cr>
noremap <m-j> :call quickui#preview#scroll(1)<cr>
let g:quickui_color_scheme = 'gruvbox'

