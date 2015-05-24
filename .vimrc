"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   ________         _
"  |  ____  \   _   | |
"  | |____) |  (_)  | |   _
"  |  ______/   _   | |__/ /   _____
"  | |         | |  |  _  /   /  _  \
"  | |         | |  | | \ \  |  (_)  \
"  |_|         |_|  |_|  \_\  \____/\_\
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: LeoMao
"
" Version: 2.7.0
"
" Sections:
"    -> General
"    -> VIM UI
"    -> Colors and Fonts
"    -> Files, backups and undo
"    -> Text, tab and indent related
"    -> Fold Settings
"    -> Visual mode related
"    -> Command mode related
"    -> Moving around, tabs and buffers
"    -> Statusline
"    -> Tags
"    -> Key mappings
"    -> Cope
"    -> Plugin Settings
"    -> Language section
"    -> grep
"    -> MISC
"
" Plugins_Included:
"    -> Buffer Explorer
"    -> Emmet
"    -> NERD Commenter
"    -> OmnicppComplete
"    -> SrcExl
"    -> Surround
"    -> TagBar
"    -> undotree
"    -> vimtex
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => General {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500
" not compatible with the old-fashion vi mode
set nocompatible
" shell
set shell=$SHELL
" Enable filetype plugin
filetype on
filetype plugin on
filetype indent on
" Set to auto read when a file is changed from the outside
set autoread

" Set map leader to " "
let mapleader = " "
let maplocalleader = " "
let g:mapleader = " "
let g:maplocalleader = " "

" When vimrc is edited, reload it
" autocmd! bufwritepost $MYVIMRC source $MYVIMRC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}
" => VIM UI {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical
set so=7
set wildignorecase
set wildmenu "Turn on WiLd menu
set guitablabel=%t
" stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~,*.synctex.gz,*.pdf

" let alt key can be mapped
set winaltkeys=no
set ruler "Always show current position

if has("gui_running")
  set guioptions-=T "remove toolbar
  set guioptions-=m "remove menubar
  set guioptions-=r "remove scrollbar
endif

set cursorline "highlight current line *Slow*
set cmdheight=1 "The commandbar height
" set showcmd "display what command was typed
set showmode "display current mode

set nu "line number
set rnu "line number (relative number)
set hid "Change buffer - without saving
" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,[,]

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things
set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros 
set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=0 "How many tenths of a second to blink 
" time out of mappings
set timeout
set ttimeoutlen=10
" No sound on errors
set novisualbell
set noerrorbells
set t_vb=
set tm=500

set mouse=a
set ttymouse=xterm2

" Paren highlight
" au Filetype cpp,c,python call Paren_highlight()
" function! Paren_highlight()
" syn match Parens display "[][{}()]"
" hi def link Parens Delimiter
" endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}
" => Colors, Fonts, Encoding {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on " Enable syntax highlight
" Set font according to system
if has("gui_running")
  if has("win32") || has("win64")
    set gfn=Consolas:h16
  else
    set gfn=Monospace\ 16
  endif
endif
set t_Co=256
set background=dark
colorscheme pika
set fileencodings=utf8
set encoding=utf8
" format options
set fo+=Mm
set fo+=crql
set ffs=unix,dos,mac " Default file types
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}
" => Files, backups and undo {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

" Persistent undo
if has("persistent_undo")
  set undodir=$HOME/.vim/.undodir
  set undofile
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}
" => Text, tab and indent related {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=2
set tabstop=2
set smarttab

set cino+=g0

" line break on 80 characters
set fo-=t
set colorcolumn=80
set tw=80

set ai "Auto indent
set wrap " Wrap lines
" set nowrap " don't Wrap lines
" set si " Set Smart indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}
" => Fold Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable
set foldlevelstart=10
set fdm=syntax
""""""""""""""""""""""""""""""
" }}}
" => Load custom settings (for leader) {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime .vimrc_leader
" }}}
" => Visual mode related {{{
""""""""""""""""""""""""""""""
" Really useful!
" substitude word
nnoremap <leader>sw :%s/<C-R><C-W>//g<left><left>
" substitude current word in selection
vnoremap <leader>sw <ESC>"syiwgv:s/<C-R>s//g<left><left>
" substitude selection
vnoremap <leader>ss "sy<ESC>:%s/<C-R>s//g<left><left>
" In visual mode when you press * or # to search for the current selection
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction
vnoremap <silent> * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}
" => Command mode related {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set current path when vim start
autocmd VimEnter * cd %:p:h

" When pressing <leader>cd switch to the directory of the open buffer
noremap <leader>cd :cd %:p:h<CR>:echo CurDir()<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}
" => Moving around, windows, tabs and buffers {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

inoremap <C-l> <Del>

nnoremap <C-Down>  <C-W>j
nnoremap <C-Left>  <C-W>h
nnoremap <C-Right> <C-W>l
nnoremap <C-Up>    <C-W>k

runtime macros/matchit.vim " include matchit plugins in vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}
" => Statusline {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the statusline
set laststatus=2

" Format the statusline
set statusline=\ %f%m%r%h\ %w\ \ CWD:\ %.40{CurDir()}\ \ \ %=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}Line:\ %l/%L:%c

function! CurDir()
  let curdir = substitute(getcwd(), $HOME, "~", "g")
  return curdir
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}
" => Tags {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au Filetype cpp,c setl tags+=~/.vim/tags/cpptags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}
" => Key mappings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set pastetoggle=<F2>

" Remap VIM 0
noremap 0 ^

" increase and decrease number under the cursor
nnoremap + <C-a>
nnoremap - <C-x>

set clipboard+=unnamed

" Move a line of text using CTRL+[jk]
nnoremap <C-j> mz:m+<CR>`z:echo "move line down"<CR>
nnoremap <C-k> mz:m-2<CR>`z:echo "move line up"<CR>
vnoremap <C-j> :m'>+<CR>:echo "move block down"<CR>`<my`>mzgv`yo`z
vnoremap <C-k> :m'<-2<CR>:echo "move block up"<CR>`>my`<mzgv`yo`z

nnoremap <leader>/ :nohl<CR>

" Fast saving
nnoremap <leader>w :w!<CR>

nnoremap <C-d> :q!<CR>
inoremap <C-d> <ESC>:q!<CR>
vnoremap <C-d> <ESC>:q!<CR>
" Fast editing of the .vimrc
nnoremap <leader>ev :e! $MYVIMRC<CR>

noremap <silent><F9> <ESC>:wa!<CR>:make<CR><CR>:cw<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}
" => Cope {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do :help cope if you are unsure what cope is. It's super useful!
noremap <F8> <ESC>:call QFSwitch()<CR>
function! QFSwitch()
  redir => ls_output
  execute ':silent! ls'
  redir END

  let exists = match(ls_output, "[Quickfix List")
  if exists == -1
    execute ':copen'
  else
    execute ':cclose'
  endif
endfunction

noremap <silent> <leader>cn :cn<CR>
noremap <silent> <leader>cp :cp<CR>

""""""""""""""""""""""""""""""
" }}}
" => Plugin settings {{{
""""""""""""""""""""""""""""""  
" --- vim-plug plugin --- {{{
execute plug#begin()

Plug 'jlanzarotta/bufexplorer'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }
Plug 'wesleyche/SrcExpl'
Plug 'hynek/vim-python-pep8-indent'
Plug 'hdima/python-syntax'
Plug 'groenewege/vim-less'
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'cakebaker/scss-syntax.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'mbbill/undotree'
Plug 'vim-scripts/OmniCppComplete'
Plug 'pangloss/vim-javascript'
Plug 'lervag/vimtex'

execute plug#end()
" }}}

" --- Buffer plugin --- {{{
let g:bufExplorerSortBy = 'name'
let g:bufExplorerShowRelativePath = 1
let g:bufExplorerShowNoName = 1

noremap <leader>bd :bd<CR>
noremap <leader>bp :bp<CR>
noremap <leader>bn :bn<CR>
" }}}

" --- SrcExl plugin --- {{{
nnoremap <buffer> <silent> <leader>se :SrcExplToggle<CR>
let g:SrcExpl_pluginList = [
      \ "BufExplorer",
      \ "__TagBar__",
      \ "Source_Explorer"
      \ ]
let g:SrcExpl_isUpdateTags = 0
" }}}

" --- Tagbar plugin --- {{{
nnoremap <silent> <leader>tb :TagbarToggle<CR> 
let g:tagbar_left = 1
let g:tagbar_width = 25
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 0
" }}}

" --- vimtex --- {{{
let g:tex_flavor = "latex"
let g:tex_fast = "Mm"
let g:vimtex_fold_enabled = 0
let g:vimtex_quickfix_ignored_warnings = [
      \ 'Underfull',
      \ 'Overfull',
      \ 'specifier changed to',
      \ 'xparse/redefine-command',
      \ 'script-not-exist',
      \ ]
" }}}

" --- NERD Commenter plugin --- {{{
let NERDCreateDefaultMappings = 0
let NERDSpaceDelims = 1
map <leader>cc <plug>NERDCommenterComment
map <leader>cu <plug>NERDCommenterUncomment
map <leader>c<space> <plug>NERDCommenterToggle
" }}}

" --- undotree plugin --- {{{
noremap <silent><F5> <ESC>:UndotreeToggle<CR>
" }}}

" --- Omni complete functions --- {{{
set completeopt=menuone,longest
set omnifunc=syntaxcomplete#Complete

let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
" }}}

" --- Emmet --- {{{
" let g:user_zen_leader_key = '<c-m>'
let g:user_emmet_install_global = 0
au Filetype html,css EmmetInstall
" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}
" => Spell checking {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
" map <leader>ss :setlocal spell!<CR>

" Shortcuts using <leader>
" map <leader>sn ]s
" map <leader>sp [s
" map <leader>sa zg
" map <leader>s? z=
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}
" => Language section {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --- python --- {{{
let python_highlight_all = 1
" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}
" => Vim grep {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated .git'
set grepprg=grep\ -nH\ $*
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}
" => MISC {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
nnoremap <leader>m mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm
" }}}
" => Load custom settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime .vimrc_custom
" }}}
" vim:fdm=marker:foldlevel=0

