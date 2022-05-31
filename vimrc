" Vim Installed plugins -----------------------{{{
if has('win32')
	call plug#begin('~/vimfiles/bundle')
else
	call plug#begin('~/.vim/bundle')
endif

let s:has_gtags = 0
let s:has_ycm = 1
let g:has_coc = 0

if has('gui')
	let s:has_keysound = 1
	let s:has_rainbow = 1
else
	let s:has_keysound = 0
	let s:has_rainbow = 0
endif

" vim folder tree and font support
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

" color scheme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'ptrr/phd-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'pboettch/vim-cmake-syntax', { 'for':['cmake'] }
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
if s:has_rainbow == 1
	Plug 'kien/rainbow_parentheses.vim'
endif

" cursor move and edit
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'

" version control tools
Plug 'tpope/vim-fugitive'
Plug 'juneedahamed/vc.vim'
Plug 'mhinz/vim-signify'

" tool plug
Plug 'drmikehenry/vim-fixkey'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'will133/vim-dirdiff'
Plug 'liuchengxu/vim-which-key'
Plug 'gyim/vim-boxdraw'
Plug 'voldikss/vim-floaterm'

" file search tool
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
" vim plugin for better marks usage
Plug 'kshenoy/vim-signature'
" auto close [ ( {
Plug 'Raimondi/delimitMate'
" wiki
Plug 'vimwiki/vimwiki'

" skywind toolbox
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/vim-quickui'
if s:has_keysound == 1
	Plug 'skywind3000/vim-keysound'
endif

" more text object
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function'
Plug 'sgur/vim-textobj-parameter'

" formating
Plug 'google/vim-glaive'
Plug 'google/vim-maktaba'
Plug 'antmusco/vim-codefmt', { 'branch': 'feature/cmake-format-support' }
Plug 'psf/black', { 'branch': 'stable' }
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/Align'

" coding
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'Shougo/echodoc.vim'
Plug 'SirVer/ultisnips'
Plug 'abelZ/vim-snippets'
if s:has_gtags == 1
	Plug 'ludovicchabant/vim-gutentags'
	Plug 'skywind3000/gutentags_plus'
endif
if s:has_ycm == 1
	Plug 'ycm-core/YouCompleteMe'
	Plug 'ycm-core/lsp-examples', { 'do': './viml/install.py'}
	Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
endif
if g:has_coc == 1
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

" debuging
Plug 'puremourning/vimspector'
Plug 'gauteh/vim-cppman'

call plug#end()
" }}}

call glaive#Install()

" detect file type -------------------------------{{{
filetype on "file type
filetype plugin on
syntax on "syntax highlighting
" }}}

" color scheme helper ----------------------------{{{
function! MyHighlights() abort
	if g:has_coc == 1
		highlight CocHighlightText term=reverse guifg=Black guibg = Yellow
	endif
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
	autocmd Syntax * call MyHighlights()
augroup END
"}}}

" nerdtree ----------------------------------------{{{
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" }}}

" Vim color sheme solarized -----------------------{{{
set background=dark
let g:solarized_italic = 0
let g:solarized_termtrans = 1
let g:solarized_termcolors=256
" }}}

" Vim color scheme dracula -----------------------{{{
let g:dracula_italic = 0
color dracula
" }}}

" Vim color scheme gruvbox -----------------------{{{
" }}}

" Vim color scheme molokai -----------------------{{{
let g:molokai_original = 1
let g:rehash256 = 1
" }}}

" Vim color scheme phd ---------------------------{{{
"}}}

" Vim common Settings ----------------------------{{{
set encoding=utf-8
set fileencoding=utf-8
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
set gcr=a:block-blinkon0
set completeopt=menuone
set cursorline
set cursorcolumn
set noswapfile
set belloff=all
set virtualedit=block
if has('win32')
	set guioptions-=l
	set guioptions-=L
	"set guioptions-=r
	"set guioptions-=R
	set guioptions-=m
	"set guioptions-=T
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim
	"set guifont=DejaVu_Sans_Mono:h12
	set guifont=DejaVuSansMono_NF:h12
endif
if has('gui_macvim')
	set guifont=DejaVuSansMono_Nerd_Font_Mono:h14
endif
if has('unix')
	set ambw=double
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
" }}}

" vim-which-key options --------------------------{{{
nnoremap <silent> <leader> :WhichKey ','<CR>
set timeoutlen=1000
" }}}

" echodoc options --------------------------------{{{
let g:echodoc#enable_at_startup = 1
set noshowmode
" }}}

" ycm options ------------------------------------{{{
if s:has_ycm == 1
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "auto close preview windows when leave insert mode
let g:ycm_semantic_triggers =  {
	  \   'css': [ 're!^\s{4}', 're!:\s+'],
	  \ 'html': ['re!\w{1}', 're!\s+', 're!</'],
	  \ 'htmldjango': ['re!\w{1}', 're!\s+', 're!</'],
	  \ 'VimspectorPrompt': [ '.', '->', ':', '<' ],
	  \ 'bash,cmake,sh': ['re!\w{5}'],
	  \}
let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "h":1,
			\ "hpp":1,
			\ "python":1,
			\ "go":1,
			\ "js":1,
			\ "cs":1,
			\ "sh":1,
			\ "cmake":1,
			\ }
let g:ycm_confirm_extra_conf = 0
let g:ycm_log_level = 'debug'
let g:ycm_always_populate_location_list = 1
let g:ycm_error_symbol = '!' "'⛔'
let g:ycm_warning_symbol = '⚠'
let g:ycm_max_diagnostics_to_display = 300
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_comments = 1
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_key_invoke_completion = '<c-l>'
noremap <c-l> <NOP>
if has('gui')
	let g:ycm_use_clangd = 0
	let g:ycm_clangd_args = ["--background-index=false"]
	if has('gui_macvim')
		let g:ycm_python_binary_path = 'python3'
	endif
else
	let g:ycm_use_clangd = 1
	let g:ycm_clangd_binary_path = '~/.vim/third-party/llvm-project/build/bin/clangd'
endif

let g:ycm_auto_hover = ''

if filereadable("~/.vim/bundle/lsp-examples/vimrc.generated")
	source ~/.vim/bundle/lsp-examples/vimrc.generated
endif
nnoremap <leader>fx :YcmCompleter FixIt<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nmap M <plug>(YCMHover)
endif
" }}}

" coc and ycm conflict----------------------------{{{
if g:has_coc == 1
	let s:coc_black_list = ["log"]
	for key in keys(g:ycm_filetype_whitelist)
		call add(s:coc_black_list, key)
	endfor

	function! s:disable_coc_for_type()
		if index(s:coc_black_list, &filetype) != -1
			if g:coc_enabled == 1
				:silent! CocDisable
				nnoremap <leader>fx :YcmCompleter FixIt<CR>
				nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
				nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
				nmap M <plug>(YCMHover)
				echom "switch to YCM"
			endif
		else
			if g:coc_enabled == 0
				:silent! CocEnable
				nmap <silent> <leader>gd <Plug>(coc-definition)
				nmap <silent> <leader>gi <Plug>(coc-implementation)
				nmap <silent> <leader>gr <Plug>(coc-references)
				nnoremap <silent> M :call <SID>show_documentation()<CR>
				echom "switch to COC"
			endif
		endif
	endfunction

	augroup CocGroup
		autocmd!
		autocmd FileType c,cpp call s:disable_coc_for_type()
		" autocmd BufNew,BufEnter,BufWinEnter * call s:disable_coc_for_type()
	augroup end
	nmap <F8> :call <SID>disable_coc_for_type()<CR>

	function! s:show_documentation()
		if (index(['vim','help'], &filetype) >= 0)
			execute 'silent! h '.expand('<cword>')
		elseif (coc#rpc#ready())
			call CocActionAsync('doHover')
		else
			execute '!' . &keywordprg . " " . expand('<cword>')
		endif
	endfunction
endif

"}}}

" ultisnips options ------------------------------{{{
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
" }}}

" coc.nvim options--------------------------------{{{
source ~/.vim/configs/coc_config.vim
" }}}

" gtags options ----------------------------------{{{
if s:has_gtags == 1
	let $GTAGSLABEL = 'native-pygments'
	let $VIMHOME=expand('<sfile>:p:h:h')
	let $GTAGSCONF = $VIMHOME."/.vim/third-party/global-6.6/gtags.conf"

	let gutentags_add_default_project_roots = 0
	let g:gutentags_project_root = ['.tagroot', '.git']
	let g:gutentags_ctags_tagfile = '.tags'
	let g:gutentags_ctags_exclude = ['*.log', '*.xml', '*.tlog', "*.vim", "*.json", "*.xml", "*vimrc"]

	let g:gutentags_ctags_executable = '~/.local/bin/ctags'
	let g:gutentags_modules = ['ctags', 'gtags_cscope']
	let g:gutentags_cache_dir = expand('/data/.cache/tags')

	let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
	let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
	let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

	" 如果使用 universal ctags 需要增加下面一行
	let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

	" 禁用 gutentags 自动加载 gtags 数据库的行为
	let g:gutentags_auto_add_gtags_cscope = 0
	let g:gutentags_define_advanced_commands = 1
	let g:gutentags_plus_nomap = 1
	let g:gutentags_generate_on_new = 0
	noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
	noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
	noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
endif
" }}}

" leaderF options --------------------------------{{{
let g:Lf_WildIgnore = {
			\ 'dir': ['.svn','.git','.hg'],
            \ 'file': ['*.sw?','~$*','*.exe','*.o','*.so','*.py[co]','*.dll','*.obj','*.lib','*.ax','*.user','*.vc*','*.pdb']
			\}
let g:Lf_WorkingDirectoryMode = 'c'
let g:Lf_Ctags = "~/.local/bin/ctags"
let g:Lf_ShortcutF = '<leader><leader>f'
let g:Lf_DefaultExternalTool = 'rg'
let g:Lf_UseVersionControlTool = 0
let g:Lf_DefaultMode = 'NameOnly'
" if v:version >=801 && has('patch1615')
	" let g:Lf_WindowPosition = 'popup'
" endif
nnoremap <silent> <leader><leader>t :LeaderfBufTag<CR>
nnoremap <silent> <leader><leader>n :LeaderfFunction<CR>
nnoremap <silent> <leader><leader>r :LeaderfMru<CR>
" search visually selected text literally, don't quit LeaderF after accepting an entry
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg --no-ignore-vcs -F --stayOpen -e %s ", leaderf#Rg#visual())<CR><CR>
" }}}

" vimspector options -----------------------------{{{
nmap <F5> <Plug>VimspectorContinue
nmap <S-F5> <Plug>VimspectorStop
nmap <C-F5> :VimspectorReset<CR>
nmap <C-S-F5> <Plug>VimspectorRestart
nmap <F9> <Plug>VimspectorToggleBreakpoint
nmap <A-F9> <Plug>VimspectorToggleConditionalBreakpoint
nmap <S-F9> <Plug>VimspectorAddFunctionBreakpoint
nmap <F10> <Plug>VimspectorStepOver
nmap <C-F10> <Plug>VimspectorRunToCursor
nmap <F11> <Plug>VimspectorStepInto
nmap <S-F11> <Plug>VimspectorStepOut
nmap <C-F7> :AsyncTask compile<cr>
nmap <C-F8> :AsyncTask build<cr>
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

" asynctasks options -----------------------------{{{
if has('win32')
	let g:asynctasks_system = 'win32'
	let g:asynctasks_term_pos = 'bottom'
elseif has('macunix')
	let g:asynctasks_system = 'macos'
	let g:asynctasks_term_pos = 'bottom'
elseif has('linux')
	let lines = readfile('/proc/version')
	if lines[0] =~ "Microsoft"
		let g:asynctasks_system = 'wsl'
		let g:asynctasks_term_pos = 'bottom'
	else
		let g:asynctasks_system = 'linux'
		let g:asynctasks_term_pos = 'bottom'
	endif
endif
" }}}

" vim-quickui options ----------------------------{{{
source ~/.vim/configs/quickui.vim
" }}}

" ale options ------------------------------------{{{
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_disable_lsp = 1
if has('win32') == 0 && has('win64') == 0 && has('win32unix') == 0
	let g:ale_command_wrapper = 'nice -n5'
endif
let g:airline#extensions#ale#enabled = 1

let g:ale_linters_explicit = 1
let g:ale_linters = {
			\ 'c' : [],
			\ 'cpp' : ['cpplint', 'clang-tidy'],
			\ 'python': ['flake8', 'pylint'],
			\ 'java': ['javac'],
			\ 'javascript': ['eslint'],
			\ 'sh': ['shellcheck'],
			\ 'cmake': ['cmakelint'],
			\ }
let g:ale_cpp_cppcheck_options = '--enable=all --suppress=unusedStructMember:*.h'
let g:ale_cpp_cpplint_executable = 'cpplint.py'
let g:ale_cmake_cmakelint_executable = 'cmake-lint'
let g:ale_cmake_cmakelint_options = '-c .cmake-lint.yaml'

nmap [g <Plug>(ale_previous)
nmap ]g <Plug>(ale_next)
" }}}

" codefmt options --------------------------------{{{
" manully install clang-format,shfmt,cmake-format
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
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_section_error = ''
let g:airline_section_warning = ''
let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'
let g:tagbar_ctags_bin = '~/.local/bin/ctags'
let g:tagbar_width = 30
nnoremap <F2> :Tagbar<CR>
if 1
	let g:airline#extensions#branch#custom_head = 'GetScmBranch'
	function! GetScmBranch()
		if !exists('b:perforce_client')
			silent! exec system('svn info')
			if v:shell_error != 0
				let b:perforce_client = ''
			else
				let b:perforce_client = trim(system('svn info | grep "Relative URL:" | sed "s@.*/@@"'))
			endif
			exec 'augroup perforce_client-'. bufnr("%")
				au!
				autocmd BufWinLeave <buffer> silent! unlet! b:perforce_client
			augroup END
		endif
		return b:perforce_client
	endfunction
endif
if g:has_coc == 1
	function! GetCursorFuncForAirline()
		return get(b:,'coc_current_function','')
	endfunction
	call airline#parts#define_function('coc', 'GetCursorFuncForAirline')
	let g:airline_section_x = airline#section#create_right(['bookmark', 'coc', 'tagbar', 'vista', 'gutentags', 'grepper', 'filetype'])
endif
" }}}

" vim-limelight options --------------------------{{{
" }}}

" vim-Goyo options -------------------------------{{{
" }}}

" signify options --------------------------------{{{
let g:signify_vcs_list = [ 'git', 'svn']
"♕ ♛ 🐒 🐍 🐢 🐓
" }}}

" nerdcommenter options --------------------------------{{{
let NERDSpaceDelims=1
" }}}

" vimwiki options --------------------------------------{{{
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_listsyms = '✗○◐●✓'
" }}}

" Vim script file Settings -----------------------{{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType xml setlocal foldmethod=indent
	autocmd FileType python setlocal tabstop=4
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o iskeyword-=.
	autocmd FileType cpp,cmake setlocal expandtab
augroup END
" }}}

" user defined mappings --------------------------{{{
nnoremap \ :Leaderf! rg -F --stayOpen -e<SPACE>
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>
nnoremap <leader>dg :diffget<CR>
nnoremap <leader>dp :diffput<CR>
tnoremap <Esc> <C-\><C-n>
set termwinkey=<C-L>
au BufRead *.log set ft=
au BufRead,BufNewFile *.hla set ft=hla
au BufRead,BufNewFile *.tasks set ft=dosini

" fix terminal mode arrow key didn't work issue
tnoremap <Esc> <C-W>N
tnoremap <Esc><Esc> <C-W>N
set timeout timeoutlen=1000  " Default
set ttimeout ttimeoutlen=100  " Set by defaults.vim
set pastetoggle=<S-F2>
imap <leader>id <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

" copy to buffer
vmap <C-c> :w! ~/.vimbuffer<CR>
nmap <C-c> :.w! ~/.vimbuffer<CR>
" paste from buffer
map <C-p> :r ~/.vimbuffer<CR>

function! RemoveTrailingSpace()
	if $VIM_HATE_SPACE_ERRORS != '0'
		normal m`
		silent! :%s/\s\+$//e
		normal ``
	endif
endfunction
autocmd BufWritePre * nested call RemoveTrailingSpace()

function! FixInconsistFileFormat()
	if &fileformat == 'unix'
		silent! :%s/\r$//e
	endif
endfunction
autocmd BufWritePre * nested call FixInconsistFileFormat()
autocmd BufWritePre *.cpp :FormatCode
autocmd BufWritePre *.h :FormatCode

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

function! ToggleFloatShell(bufname)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
      exec('FloatermKill!')
	  return
  endfor
  exec('FloatermToggle')
endfunction
nmap <F6> :call ToggleFloatShell('Terminal')<CR>

if has('win32')
	"visual studio 2019 error format
	set errorformat=%.%#>%f(%l\\\,%c):\ %m
	set errorformat+=%.%#>%f(%l%.%#):\ %m
	nnoremap <F3> :call ToggleList("Location 列表", 'l')<CR>
	nnoremap <F4> :call ToggleList("QuickFix 列表", 'c')<CR>
else
	nnoremap <F3> :call ToggleList("Location", 'l')<CR>
	nnoremap <F4> :call ToggleList("QuickFix", 'c')<CR>
endif
" }}}

"--Ctrl + X map--
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
