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
Plug 'mhinz/vim-signify'
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
Plug 'skywind3000/vim-keysound'
Plug 'skywind3000/asyncrun.vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'
Plug 't9md/vim-choosewin'
Plug 'w0rp/ale'
Plug 'kien/rainbow_parentheses.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'haya14busa/vim-gtrans'
Plug 'ap/vim-css-color', { 'for':['css', 'html'] }
Plug 'mattn/emmet-vim', { 'for':['css', 'html'] }
if has('win32') || has('gui_macvim')
	Plug 'itchyny/calendar.vim'
	let s:has_calendar = 1
else
endif
let languageclient = 0
if languageclient == 1
	Plug 'autozimu/LanguageClient-neovim'
endif

call plug#end()

"detect file type
filetype on "file type
filetype plugin on
syntax on "syntax highlighting

set background=dark
let g:solarized_italic = 0
let g:solarized_termtrans = 1
colorscheme solarized

set encoding=utf-8
set number "display line number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set cindent "use c\c++ indent style
set autoindent
set nobackup
set hlsearch
set incsearch
set ignorecase
set showcmd
set autoread
"set foldmethod=manual
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

"--signify options--
let g:signify_vcs_list = [ 'svn', 'git' ]

"--echodoc options--
let g:echodoc#enable_at_startup = 1
set noshowmode

"--languageclient options-- 
set runtimepath+=~/vimfiles/bundle/LanguageClient-neovim
set hidden

if languageclient == 1
	let g:LanguageClient_serverCommands = {
				\ 'c': ['cquery', '--log-file=~\\vimfiles\\cq.log'],
				\ 'cpp': ['cquery', '--log-file=~\\vimfiles\\cq.log'],
				\ }
	let g:LanguageClient_diagnosticsEnable = 0
endif

"--ycm options--
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "auto close preview windows when leave insert mode
let g:ycm_semantic_triggers =  {
	  \ 'c,cpp': ['re!\w{5}'],
	  \ 'python,javascript': ['re!\w{5}'],
	  \   'css': [ 're!^\s{4}', 're!:\s+'],
	  \ 'html': ['re!\w{1}', 're!\s+', 're!</'],
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
let g:ycm_filetype_whitelist = { 
			\ "c":1,
			\ "cpp":1, 
			\ "python":1,
			\ "javascript":1,
			\ "vim":1, 
			\ "make":1,
			\ "cmake":1,
			\ "html":1,
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
nmap <c-z> <NOP>
nmap <leader>fx :YcmCompleter FixIt<CR>
nmap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <leader>gr :YcmCompleter GoToReferences<CR>
nmap <leader>gt :YcmCompleter GetDoc<CR>

"--ultisnips options--
let g:UltiSnipsExpandTrigger = "<C-k>"
let g:UltiSnipsJumpForwardTrigger = "<C-k>"
let g:UltiSnipsJumpBackwardTrigger = "<C-l>"

"--gtags options--
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = 'c:\\Users\\Dell\\vimfiles\\gtags.conf'

let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'

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

"--leaderF options--
let g:Lf_WildIgnore = {
			\ 'dir': ['.svn','.git','.hg'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]','*.dll','*.obj','*.lib','*.ax']
			\}
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_Ctags = "universal-ctags"
let g:Lf_ShortcutF = '<leader><leader>f'
"let g:Lf_DefaultMode = 'FullPath'

"--preview_vim options--
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
if has('gui_macvim')
	noremap <D-k> :PreviewScroll -1<cr>
	noremap <D-j> :PreviewScroll +1<cr>
else
	noremap <m-k> :PreviewScroll -1<cr>
	noremap <m-j> :PreviewScroll +1<cr>
endif

"--vim keysound options--
let g:keysound_enable = 1
let g:keysound_theme = 'default'

"--asyncrun options--
let g:asyncrun_open = 10
let g:asyncrun_bell = 1
let g:asyncrun_encs = 'gbk'

"--vim-choosewin options--
if has ('gui_macvim')
	nmap <D-e> <Plug>(choosewin)
else
	nmap <m-e> <Plug>(choosewin)
endif

"--ale options--
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

"--rainbowparentheses options--
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"--airline options--
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'
let g:airline_section_error = ''
let g:airline_section_warning = ''
let g:tagbar_ctags_bin = 'universal-ctags'

if s:has_calendar == 1
	"--calendar options--
	let g:calendar_frame = 'default'
	let g:calendar_google_calendar = 1
	let g:calendar_google_task = 1
endif

"--user defined options--
nmap <silent> dg :diffg<CR>
nmap <silent> dp :diffp<CR>
nmap <silent> <leader><leader>a :A<CR>
nmap <silent> <leader><leader>t :LeaderfBufTag<CR>
nmap <silent> <leader><leader>n :LeaderfFunction<CR>
nmap <silent> <leader><leader>m :LeaderfMarks<CR>
noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
"nmap <silent> <leader><leader>r :AsyncRun ag --nogroup --nocolor <cword><CR>
"nnoremap \ :AsyncRun ag --nogroup --nocolor<SPACE>
nmap <silent> <leader><leader>r :AsyncRun rg --vimgrep -w <cword> -t cpp -t c<CR>
nnoremap \ :AsyncRun rg --vimgrep -i<SPACE>
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>
map <C-i> :pyf d:/Program Files (x86)/LLVM/share/clang/clang-format.py<CR>
imap <C-i> <C-o>:pyf d:/Program Files (x86)/LLVM/share/clang/clang-format.py<CR>
nmap <leader>tr :Gtrans --to=zh_CN 

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

nmap <F3> :Autoformat<CR>
if has('win32')
	nmap <F9> :call ToggleList("Location 列表", 'l')<CR>
else
	nmap <F9> :call ToggleList("Location", 'l')<CR>
endif
nmap <F10> :call asyncrun#quickfix_toggle(10)<CR>

"--Ctrl + X map--
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
