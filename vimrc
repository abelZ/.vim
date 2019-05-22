" Vim Installed plugins -----------------------{{{
if has('win32')
	call plug#begin('~/vimfiles/bundle')
else
	call plug#begin('~/.vim/bundle')
endif

Plug 'fholgado/minibufexpl.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'kshenoy/vim-signature'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'Valloric/YouCompleteMe'
Plug 'Shougo/echodoc.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/Align'
Plug 'will133/vim-dirdiff'
Plug 'tpope/vim-unimpaired'
Plug 'Yggdroot/LeaderF'
Plug 'Yggdroot/LeaderF-marks'
Plug 'Raimondi/delimitMate'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview'
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/quickmenu.vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'
Plug 'w0rp/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'gyim/vim-boxdraw'
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'
Plug 'pboettch/vim-cmake-syntax', { 'for':['cmake'] }
let s:has_calendar = 0
let s:has_keysound = 0
let s:has_instant_mark = 0
let s:has_rainbow = 0
if has('win32') || has('gui_macvim')
	let s:has_calendar = 1
	Plug 'itchyny/calendar.vim'
	let s:has_keysound = 1
	Plug 'skywind3000/vim-keysound'
	let s:has_instant_mark = 1
	Plug 'suan/vim-instant-markdown'
	let s:has_rainbow = 1
	Plug 'kien/rainbow_parentheses.vim'
endif
if has('win32')
	Plug 'haya14busa/vim-gtrans'
else
	Plug 'echuraev/translate-shell.vim'
	Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
endif
let languageclient = 0
if languageclient == 1
	Plug 'autozimu/LanguageClient-neovim'
endif

call plug#end()
" }}}

" detect file type -------------------------------{{{
filetype on "file type
filetype plugin on
syntax on "syntax highlighting
" }}}

" Vim color sheme Settings -----------------------{{{
set background=dark
let g:solarized_italic = 0
let g:solarized_termtrans = 1
colorscheme solarized
" }}}

" Vim common Settings ----------------------------{{{
set encoding=utf-8
set number "display line number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set cindent "use c\c++ indent style
set autoindent
set history=50
set nobackup
set hlsearch
set incsearch
set ignorecase
set showcmd
set autoread
set backspace=2
set completeopt=menuone,longest
set gcr=a:block-blinkon0
set cursorline
set cursorcolumn
set noswapfile
if has('win32')
	set guioptions-=l
	set guioptions-=L
	"set guioptions-=r
	"set guioptions-=R
	set guioptions-=m
	"set guioptions-=T
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim
endif
let mapleader = ","
set grepprg=rg\ --vimgrep

nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>" viw<ESC>a"<ESC>bi"<ESC>lel
vnoremap <leader>" <ESC>a"<ESC>`<i"<ESC>`>ll
nnoremap <leader>' viw<ESC>a'<ESC>bi'<ESC>lel
vnoremap <leader>' <ESC>a'<ESC>`<i'<ESC>`>ll
vnoremap <leader>( <ESC>a)<ESC>`<i(<ESC>`>ll
nnoremap H 0
nnoremap L $
inoremap jk <ESC>
inoremap <ESC> <NOP>
" }}}

" quickmenu options ------------------------------{{{
" choose a favorite key to show/hide quickmenu
noremap <silent><F12> :call quickmenu#toggle(0)<cr>

" enable cursorline (L) and cmdline help (H)
let g:quickmenu_options = "HL"

" clear all the items
call g:quickmenu#reset()

" }}}

" echodoc options --------------------------------{{{
let g:echodoc#enable_at_startup = 1
set noshowmode
" }}}

" languageclient options -------------------------{{{
if languageclient == 1
	set runtimepath+=~/.vim/bundle/LanguageClient-neovim
	set hidden
	let g:LanguageClient_serverCommands = {
				\ 'c': ['cquery', '--log-file=~\\vimfiles\\cq.log'],
				\ 'cpp': ['cquery', '--log-file=~\\vimfiles\\cq.log'],
				\ }
	let g:LanguageClient_diagnosticsEnable = 0
endif
" }}}

" ycm options ------------------------------------{{{
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "auto close preview windows when leave insert mode
let g:ycm_semantic_triggers =  {
	  \ 'c,cpp': ['re!\w{5}'],
	  \ 'python,javascript': ['re!\w{5}'],
	  \   'css': [ 're!^\s{4}', 're!:\s+'],
	  \ 'html': ['re!\w{1}', 're!\s+', 're!</'],
	  \ 'htmldjango': ['re!\w{1}', 're!\s+', 're!</'],
	  \}
let g:ycm_confirm_extra_conf = 0
let g:ycm_server_log_level = 'info'
let g:ycm_always_populate_location_list = 1
let g:ycm_error_symbol = 'E'
let g:ycm_warning_symbol = 'W'
let g:ycm_max_diagnostics_to_display = 300
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_comments = 0
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_clangd_args = ['-background-index']
if has('gui_macvim')
	let g:ycm_python_binary_path = '/usr/local/bin/python3'
endif
if has('win32')
	let g:ycm_python_binary_path = 'd:\\unix\\Python37\\python.exe'
endif
let g:ycm_filetype_whitelist = { 
			\ "c":1,
			\ "cpp":1, 
			\ "python":1,
			\ "javascript":1,
			\ "vim":1, 
			\ "make":1,
			\ "cmake":1,
			\ "html":1,
			\ "htmldjango":1,
			\ "css":1,
			\ "less":1,
			\ "json":1,
			\ "typedscript":1,
			\ "sh":1,
			\ "zsh":1,
			\ "bash":1,
			\ "conf":1,
			\ "config":1,
			\ }
noremap <c-z> <NOP>

call g:quickmenu#append('# YCM', '')
call g:quickmenu#append(mapleader.'fx Ycm FixIt', 'YcmCompleter FixIt', 'fix the code error by clang', 'c,cpp')
call g:quickmenu#append(mapleader.'gd Ycm GoToDef', 'YcmCompleter GoToDefinitionElseDeclaration', 'go to the var or function definition')
call g:quickmenu#append(mapleader.'gr Ycm GoToRef', 'YcmCompleter GoToReferences', 'find all references of the var or function')
nnoremap <leader>fx :YcmCompleter FixIt<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
" }}}

" ultisnips options ------------------------------{{{
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
" }}}

" gtags options ----------------------------------{{{
let $GTAGSLABEL = 'native-pygments'
if has('win32')
	let $GTAGSCONF = 'c:\\Users\\Dell\\vimfiles\\gtags.conf'
elseif has('gui_macvim')
	let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
else
	let $GTAGSCONF = '/home/abel/.vim/gtags.conf'
endif

let gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['.tags']
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_ctags_exclude = ['*.log', '*.xml', '*.tlog']

let g:gutentags_ctags_executable = 'universal-ctags'
let g:gutentags_modules = ['ctags', 'gtags_cscope']
let g:gutentags_cache_dir = expand('~/.cache/tags')

let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0
"let g:gutentags_define_advanced_commands = 1
let g:gutentags_plus_nomap = 1
let g:gutentags_generate_on_new = 0
call g:quickmenu#append('# Gtags', '')
call g:quickmenu#append(mapleader.'gs find symbol', 'GscopeFind s <C-R><C-W>', 'find all appearence of the symbol in gtags database')
call g:quickmenu#append(mapleader.'gc find calling', 'GscopeFind c <C-R><C-W>', 'find all function calling this function in gtags database')
call g:quickmenu#append(mapleader.'gt find text', 'GscopeFind t <C-R><C-W>', 'find the string appearence of the text in gtags database')
noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
" }}}

" leaderF options --------------------------------{{{
let g:Lf_WildIgnore = {
			\ 'dir': ['.svn','.git','.hg'],
            \ 'file': ['*.sw?','~$*','*.exe','*.o','*.so','*.py[co]','*.dll','*.obj','*.lib','*.ax','*.log','*.user','*.vc*','*.xml','*.bat','*.pdb']
			\}
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_Ctags = "universal-ctags"
let g:Lf_ShortcutF = '<leader><leader>f'
let g:Lf_DefaultExternalTool = 'rg'
let g:Lf_DefaultMode = 'NameOnly'
call g:quickmenu#append('# LeaderF', '')
call g:quickmenu#append(mapleader.mapleader.'t search file', 'LeaderfBufTag', 'search file in current path recursive')
call g:quickmenu#append(mapleader.mapleader.'n search func', 'LeaderfFunction', 'search functions in current file')
call g:quickmenu#append(mapleader.mapleader.'m search mark', 'LeaderfMarks', 'search marks in current buffer')
call g:quickmenu#append(mapleader.mapleader.'r search mru', 'LeaderfMru', 'search file in most recently used files')
nnoremap <silent> <leader><leader>t :LeaderfBufTag<CR>
nnoremap <silent> <leader><leader>n :LeaderfFunction<CR>
nnoremap <silent> <leader><leader>m :LeaderfMarks<CR>
nnoremap <silent> <leader><leader>r :LeaderfMru<CR>
" }}}

" preview_vim options ----------------------------{{{
call g:quickmenu#append('# Preview_vim', '')
call g:quickmenu#append('p preview quickfix', 'PreviewQuickfix', 'preview the item in quickfix window')
call g:quickmenu#append('P preview close', 'PreviewClose', 'close the preview')
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
if has('gui_macvim')
	noremap <D-k> :PreviewScroll -1<cr>
	noremap <D-j> :PreviewScroll +1<cr>
else
	noremap <m-k> :PreviewScroll -1<cr>
	noremap <m-j> :PreviewScroll +1<cr>
endif
" }}}

" vim keysound options ---------------------------{{{
if s:has_keysound == 1
	let g:keysound_enable = 1
	let g:keysound_theme = 'default'
endif
" }}}

" asyncrun options -------------------------------{{{
let g:asyncrun_open = 10
let g:asyncrun_bell = 1
let g:asyncrun_encs = 'gbk'
let g:asyncrun_stdin = 0
" }}}

" ale options ------------------------------------{{{
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 0
let g:ale_lint_on_enter = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_linters_explicit = 1
if has('win32') == 0 && has('win64') == 0 && has('win32unix') == 0
	let g:ale_command_wrapper = 'nice -n5'
endif
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
			\ 'c' : [],
			\ 'cpp' : ['cppcheck'],
			\ 'python': ['flake8', 'pylint'], 
			\ 'java': ['javac'],
			\ 'javascript': ['eslint'], 
			\ }
let g:ale_cpp_cppcheck_options = '--enable=style --suppress=unusedStructMember:*.h'
call g:quickmenu#append('# ALE', '')
call g:quickmenu#append('ALELint ale lint', 'ALELint', 'mannuly run ALELint')
" }}}

" rainbowparentheses options ---------------------{{{
if s:has_rainbow == 1
	augroup rainbow_group
		autocmd!
		let rainbow_black_list = ['cmake']
		au VimEnter * if index(rainbow_black_list, &ft) < 0 | RainbowParenthesesToggle
		au Syntax * if index(rainbow_black_list, &ft) < 0 | RainbowParenthesesLoadRound
		au Syntax * if index(rainbow_black_list, &ft) < 0 | RainbowParenthesesLoadSquare
		au Syntax * if index(rainbow_black_list, &ft) < 0 | RainbowParenthesesLoadBraces
	augroup END
endif
" }}}

" airline options --------------------------------{{{
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'
let g:airline_section_error = ''
let g:airline_section_warning = ''
let g:tagbar_ctags_bin = 'universal-ctags'
" }}}

" calendar options -------------------------------{{{
if s:has_calendar == 1
	"--calendar options--
	let g:calendar_frame = 'default'
	let g:calendar_google_calendar = 1
	let g:calendar_google_task = 1
endif
" }}}

" vim-instant-markdown options -------------------{{{
if s:has_instant_mark == 1
	let g:instant_markdown_slow = 1
	let g:instant_markdown_autostart = 0
	let g:instant_markdown_open_to_the_world = 1
	let g:instant_markdown_allow_unsafe_content = 1
endif
" }}}

" Vim script file Settings -----------------------{{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType xml setlocal foldmethod=indent
augroup END
" }}}

" user defined mappings --------------------------{{{
nnoremap <F3> :Autoformat<CR>
nnoremap <silent> <leader><leader>a :A<CR>
nnoremap \ :AsyncRun rg --vimgrep -i<SPACE>
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>
if has('win32')
	noremap <C-i> :pyf d:/Program Files (x86)/LLVM/share/clang/clang-format.py<CR>
	inoremap <C-i> <C-o>:pyf d:/Program Files (x86)/LLVM/share/clang/clang-format.py<CR>
	vnoremap <leader>tr :Gtrans -o=buffer<CR>
elseif has('gui_macvim')
	noremap <C-i> :pyf /usr/local/opt/llvm/share/clang/clang-format.py<CR>
	inoremap <C-i> <C-o>:pyf /usr/local/opt/llvm/share/clang/clang-format.py<CR>
	vnoremap <leader>tr :Trans :zh<CR>
else
	vnoremap <leader>tr :Trans :zh<CR>
endif
" }}}

" quickfix and localtion list Settings ----------{{{
function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

if has('win32')
	nnoremap <F9> :call ToggleList("Location 列表", 'l')<CR>
else
	nnoremap <F9> :call ToggleList("Location", 'l')<CR>
endif
nnoremap <F10> :call asyncrun#quickfix_toggle(10)<CR>
" }}}

" table calc function --------------------------{{{
"index:1 index:2
"index:3 index:4 --> index:4 index:6
"
"100
"200 --> 300
function! s:sum_visual(sep1, sep2) range
	let l:lines = []
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
	for i in range(line_start, line_end)
		call add(l:lines, getline(i)[column_start - 1: column_end - (&selection == 'inclusive' ? 1 : 2)])
	endfor
	let l:sum_value = []
	for l:linestr in lines
		let l:idx = 0
		for j in split(l:linestr, a:sep1)
			let l:attr = split(j, a:sep2)
			if len(l:attr) == 1
				call insert(l:attr, '')
			endif
			if len(l:attr) == 2
				if len(l:sum_value) > l:idx
					let l:sum_value[l:idx][1] += l:attr[1]
				else
					call add(l:sum_value, l:attr)
				endif
				let l:idx += 1
			endif
		endfor
	endfor
	let l:tmp2 = []
	for i in range(len(l:sum_value))
		call add(l:tmp2, join(l:sum_value[i], a:sep2))
	endfor
	call setline(a:lastline+1, join(l:tmp2, a:sep1) . getline(a:lastline+1))
	call setpos('.', [0, a:lastline+1, 1, 0])
endfunction
command! -range Sum <line1>,<line2>call s:sum_visual(' ', ':')

function! CalcCurrentLine()
	return ' = ' . eval(split(getline('.'), '=')[0])
endfunction
inoremap <C-D><C-C> <C-R>=CalcCurrentLine()<CR>
" }}}

"--Ctrl + X map--
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
