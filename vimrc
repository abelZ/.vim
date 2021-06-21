" Vim Installed plugins -----------------------{{{
if has('win32')
	call plug#begin('~/vimfiles/bundle')
else
	call plug#begin('~/.vim/bundle')
endif

let s:has_calendar = 0
let s:has_keysound = 0
let s:has_instant_mark = 0
let s:has_rainbow = 0
if filereadable(getcwd() . '/compile_commands.json') || filereadable(getcwd() . '/.ycm_extra_conf.py')
	let s:has_ycm = 1
	let g:has_coc = 0
else
	let s:has_ycm = 0
	let g:has_coc = 1
endif
let s:has_echodoc = 1
let s:has_transshell = 0
let s:has_solarized = 1
let s:has_dracula = 1
let s:has_gruvbox = 1
let s:has_signify = 1
let s:has_tagbar = 1
let s:has_gtags = 0
let s:has_ale = 1
let s:has_vimspector = 1

if !has('win32')
	let s:has_transshell = 1
endif

if has('win32') || has('gui_macvim')
	let s:has_calendar = 1
	let s:has_keysound = 1
	let s:has_instant_mark = 1
endif

if has('gui')
	let s:has_rainbow = 1
endif

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'kshenoy/vim-signature'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'juneedahamed/vc.vim'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'vim-scripts/Align'
Plug 'will133/vim-dirdiff'
Plug 'tpope/vim-unimpaired'
Plug 'puremourning/vimspector'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'Raimondi/delimitMate'
Plug 'skywind3000/vim-preview'
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/quickmenu.vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function'
Plug 'sgur/vim-textobj-parameter'
Plug 'terryma/vim-multiple-cursors'
Plug 'abelZ/vim-coloresque'
Plug 'mattn/emmet-vim'
Plug 'pboettch/vim-cmake-syntax', { 'for':['cmake'] }
Plug 'liuchengxu/vim-which-key'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'psf/black', { 'branch': 'stable' }

if s:has_ale == 1
	Plug 'w0rp/ale'
endif

if s:has_gtags == 1
	Plug 'ludovicchabant/vim-gutentags'
	Plug 'skywind3000/gutentags_plus'
endif

if s:has_tagbar == 1
	Plug 'majutsushi/tagbar'
endif

if s:has_solarized == 1
	Plug 'altercation/vim-colors-solarized'
endif

if s:has_dracula == 1
	Plug 'dracula/vim'
endif

if s:has_gruvbox == 1
	Plug 'morhetz/gruvbox'
endif

if s:has_ycm == 1
	Plug 'ycm-core/YouCompleteMe'
	Plug 'ycm-core/lsp-examples', { 'do': './viml/install.py'}
	Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
endif

if g:has_coc == 1
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

if s:has_echodoc == 1
	Plug 'Shougo/echodoc.vim'
endif

if s:has_calendar == 1
	Plug 'itchyny/calendar.vim'
endif

if s:has_keysound == 1
	Plug 'skywind3000/vim-keysound'
endif

if s:has_instant_mark == 1
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
endif

if s:has_rainbow == 1
	Plug 'kien/rainbow_parentheses.vim'
endif

if s:has_transshell == 1
	Plug 'echuraev/translate-shell.vim'
endif

if s:has_signify == 1
	Plug 'mhinz/vim-signify'
endif

call plug#end()
" }}}

" detect file type -------------------------------{{{
filetype on "file type
filetype plugin on
syntax on "syntax highlighting
" }}}

" quickmenu options ------------------------------{{{
" choose a favorite key to show/hide quickmenu
noremap <silent><F12> :call quickmenu#toggle(0)<cr>

" enable cursorline (L) and cmdline help (H)
let g:quickmenu_options = "HL"

" clear all the items
call g:quickmenu#reset()

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

call g:quickmenu#append('# ColorScheme', '')
"}}}

" nerdtree ----------------------------------------{{{
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" }}}

" Vim color sheme solarized -----------------------{{{
if s:has_solarized == 1
	set background=dark
	let g:solarized_italic = 0
	let g:solarized_termtrans = 1
	"color solarized
	call g:quickmenu#append('Solarized', 'color solarized', '')
endif
" }}}

" Vim color scheme dracula -----------------------{{{
if s:has_dracula == 1
	let g:dracula_italic = 0
	color dracula
	call g:quickmenu#append('Dracula', 'color dracula', '')
endif
" }}}

" Vim color scheme gruvbox -----------------------{{{
if s:has_gruvbox == 1
	call g:quickmenu#append('Gruvbox', 'color gruvbox', '')
endif
" }}}

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
	set guifont=Menlo:h14
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
if s:has_echodoc == 1
let g:echodoc#enable_at_startup = 1
set noshowmode
endif
" }}}

" ycm options ------------------------------------{{{
if s:has_ycm == 1
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "auto close preview windows when leave insert mode
let g:ycm_semantic_triggers =  {
	  \   'css': [ 're!^\s{4}', 're!:\s+'],
	  \ 'html': ['re!\w{1}', 're!\s+', 're!</'],
	  \ 'htmldjango': ['re!\w{1}', 're!\s+', 're!</'],
	  \ 'VimspectorPrompt': [ '.', '->', ':', '<' ],
	  \}
let g:ycm_confirm_extra_conf = 0
let g:ycm_log_level = 'debug'
let g:ycm_always_populate_location_list = 1
let g:ycm_error_symbol = '⛔'
let g:ycm_warning_symbol = '⚠'
let g:ycm_max_diagnostics_to_display = 300
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_comments = 0
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_key_invoke_completion = '<c-l>'
let g:ycm_use_clangd = 0
let g:ycm_clangd_args = ["--background-index=false"]
let g:ycm_auto_hover = ''
nmap <leader>D <plug>(YCMHover)
if has('gui_macvim')
	let g:ycm_python_binary_path = '/usr/local/bin/python3'
endif
let g:ycm_filetype_whitelist = { 
			\ "c":1,
			\ "cpp":1, 
			\ "python":1,
			\ "java":1,
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
noremap <c-l> <NOP>

let g:ycm_language_server = [
  \   { 'name': 'vim',
  \     'filetypes': [ 'vim' ],
  \     'cmdline': [ expand( '$HOME/.vim/bundle/lsp-examples/viml/node_modules/.bin/vim-language-server' ), '--stdio' ]
  \   }
  \ ]
call g:quickmenu#append('# YCM', '')
call g:quickmenu#append(mapleader.'fx Ycm FixIt', 'YcmCompleter FixIt', 'fix the code error by clang', 'c,cpp')
call g:quickmenu#append(mapleader.'gd Ycm GoToDef', 'YcmCompleter GoToDefinitionElseDeclaration', 'go to the var or function definition')
call g:quickmenu#append(mapleader.'gr Ycm GoToRef', 'YcmCompleter GoToReferences', 'find all references of the var or function')
nnoremap <leader>fx :YcmCompleter FixIt<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
endif
" }}}

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
	if has('win32')
		let $GTAGSCONF = 'c:\\Users\\Dell\\vimfiles\\gtags.conf'
	elseif has('gui_macvim')
		let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
	else
		let $GTAGSCONF = '/home/abel/.vim/gtags.conf'
	endif

	let gutentags_add_default_project_roots = 0
	let g:gutentags_project_root = ['.tagroot']
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
	let g:gutentags_define_advanced_commands = 1
	let g:gutentags_plus_nomap = 1
	let g:gutentags_generate_on_new = 0
	call g:quickmenu#append('# Gtags', '')
	call g:quickmenu#append(mapleader.'gs find symbol', 'GscopeFind s <C-R><C-W>', 'find all appearence of the symbol in gtags database')
	call g:quickmenu#append(mapleader.'gc find calling', 'GscopeFind c <C-R><C-W>', 'find all function calling this function in gtags database')
	call g:quickmenu#append(mapleader.'gt find text', 'GscopeFind t <C-R><C-W>', 'find the string appearence of the text in gtags database')
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
let g:Lf_Ctags = "universal-ctags"
let g:Lf_ShortcutF = '<leader><leader>f'
let g:Lf_DefaultExternalTool = 'rg'
let g:Lf_UseVersionControlTool = 0
let g:Lf_DefaultMode = 'NameOnly'
if v:version >=801 && has('patch1615')
	let g:Lf_WindowPosition = 'popup'
endif
call g:quickmenu#append('# LeaderF', '')
call g:quickmenu#append(mapleader.mapleader.'t search file', 'LeaderfBufTag', 'search file in current path recursive')
call g:quickmenu#append(mapleader.mapleader.'n search func', 'LeaderfFunction', 'search functions in current file')
call g:quickmenu#append(mapleader.mapleader.'m search mark', 'LeaderfMarks', 'search marks in current buffer')
call g:quickmenu#append(mapleader.mapleader.'r search mru', 'LeaderfMru', 'search file in most recently used files')
nnoremap <silent> <leader><leader>t :LeaderfBufTag<CR>
nnoremap <silent> <leader><leader>n :LeaderfFunction<CR>
nnoremap <silent> <leader><leader>m :LeaderfMarks<CR>
nnoremap <silent> <leader><leader>r :LeaderfMru<CR>
" search visually selected text literally, don't quit LeaderF after accepting an entry
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F --stayOpen -e %s ", leaderf#Rg#visual())<CR><CR>
" }}}

" vimspector options -----------------------------{{{
if s:has_vimspector == 1
	nmap <F5> <Plug>VimspectorContinue
	nmap <S-F5> <Plug>VimspectorStop
	nmap <F6> <Plug>VimspectorStop
	nmap <F7> <Plug>VimspectorReset
	nmap <F9> <Plug>VimspectorToggleBreakpoint
	nmap <S-F9> <Plug>VimspectorToggleConditionalBreakpoint
	nmap <A-F9> <Plug>VimspectorAddFunctionBreakpoint
	nmap <F10> <Plug>VimspectorStepOver
	nmap <F11> <Plug>VimspectorStepInto
	nmap <S-F11> <Plug>VimspectorStepOut
endif
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

" asynctasks options -----------------------------{{{
if has('win32')
	let g:asynctasks_system = 'win32'
	let g:asynctasks_term_pos = 'quickfix'
elseif has('macunix')
	let g:asynctasks_system = 'macos'
	let g:asynctasks_term_pos = 'quickfix'
elseif has('linux')
	let lines = readfile('/proc/version')
	if lines[0] =~ "Microsoft"
		let g:asynctasks_system = 'wsl'
		let g:asynctasks_term_pos = 'bottom'
	else
		let g:asynctasks_system = 'linux'
		let g:asynctasks_term_pos = 'quickfix'
	endif
endif
" }}}

" ale options ------------------------------------{{{
if s:has_ale == 1
	let g:ale_echo_delay = 20
	let g:ale_lint_delay = 500
	let g:ale_echo_msg_format = '[%linter%] %code: %%s'
if has('gui')
	let g:ale_lint_on_save = 0
	let g:ale_lint_on_enter = 0
endif
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
				\ 'cpp' : ['cpplint'],
				\ 'python': ['flake8', 'pylint'], 
				\ 'java': ['javac'],
				\ 'javascript': ['eslint'], 
				\ }
	let g:ale_cpp_cppcheck_options = '--enable=all --suppress=unusedStructMember:*.h'
	let g:ale_cpp_cpplint_executable = 'cpplint.py'

	nmap [g <Plug>(ale_previous)
	nmap ]g <Plug>(ale_next)
	call g:quickmenu#append('# ALE', '')
	call g:quickmenu#append('ALELint ale lint', 'ALELint', 'mannuly run ALELint')
endif
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
if s:has_tagbar == 1
	let g:airline#extensions#tagbar#enabled = 1
	let g:airline#extensions#tagbar#flags = 'f'
	let g:tagbar_ctags_bin = 'universal-ctags'
	nnoremap <F2> :Tagbar<CR>
endif
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

" calendar options -------------------------------{{{
if s:has_calendar == 1
	let g:calendar_frame = 'default'
	let g:calendar_google_calendar = 1
	let g:calendar_google_task = 1
endif
" }}}

" vim-instant-markdown options -------------------{{{
if s:has_instant_mark == 1
	let g:mkdp_refresh_slow=1
endif
" }}}

" vim-markdwon options ---------------------------{{{
autocmd FileType markdown let b:sleuth_automatic=0
autocmd FileType markdown set conceallevel=0

let g:vim_markdown_frontmatter=1
" }}}

" vim-limelight options --------------------------{{{
call g:quickmenu#append('# Limelight', '')
call g:quickmenu#append('Limelight', 'Limelight', 'toggle limelight')
" }}}

" vim-Goyo options -------------------------------{{{
call g:quickmenu#append('# Goyo', '')
call g:quickmenu#append('Goyo', 'Goyo', 'toggle Goyo')
" }}}

" signify options --------------------------------{{{
if s:has_signify == 1
    let g:signify_vcs_list = [ 'git', 'svn']
	"♕ ♛ 🐒 🐍 🐢 🐓 	   
endif
" }}}

" Vim script file Settings -----------------------{{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType xml setlocal foldmethod=indent
	autocmd FileType python setlocal tabstop=4
augroup END
" }}}

" user defined mappings --------------------------{{{
nnoremap \ :Leaderf! rg -F --stayOpen -e<SPACE>
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>
if s:has_transshell == 1
	vnoremap <leader>tr :Trans :zh<CR>
endif
nnoremap <leader>dg :diffget<CR>
nnoremap <leader>dp :diffput<CR>
tnoremap <Esc> <C-\><C-n>
set termwinkey=<C-L>
au BufRead *.log set ft=
au BufRead,BufNewFile *.hla set ft=hla
au BufRead,BufNewFile *.tasks set ft=dosini

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
