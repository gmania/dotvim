"gmania's vimrc

" For pathogen.vim: auto load all plugins in .vim/bundle
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" general settings
"----------------------------------------------------------------------------
set nocompatible

"*******added 6 June 2011****
set autoread
set clipboard=unnamed
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

"*******************
set vb t_vb=            " disable bell
set history=500		" keep 500 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set hlsearch
set incsearch		" do incremental searching
set viminfo+=!      "make sure it can save viminfo
set wildmenu            " type :h and press <Tab> to look what happens
set wildignore=*.bak,*.o,*.e,*~
set hid                 " allow to change buffer without saving
set whichwrap+=<,>,h,l  " allow backspace and cursor keys to wrap
set noerrorbells        " do not make noise
set cmdheight=2         " set two lines with command line
"set completeopt=menu,preview " use menu completion
"set nocursorline	     " disable hilight line
"set nocursorcolumn           " disable hilight colum
set matchpairs+=<:>	     " add match
set showmatch	             " show match "([{<" after a few seconds when input key ")[{<"
                             " the during time can be seted by "matchtime"
set matchtime=5	             " match time 0.5s
set scrolloff=2              " display context when scroll
                             " it will always in middle if set 999 
                             " unless file beginning or ending
set sidescrolloff=2          " display side context when scroll right or left
set linebreak	             " wrap long lines at a character
set nu                      " show line number
set ignorecase
set smartcase
set gdefault

" text formatting/layout
"----------------------------------------------------------------------------
set autoindent          " autoindent
set smartindent         " smartindent
set cindent             " do C-style indenting
"set textwidth=78       " ?default 0, but format with 78
set tabstop=4           " tab spacing
set softtabstop=4       " unify it
set shiftwidth=4        " unify it
set expandtab           " insert space instead of tabs!
set smarttab            " use tabs at the start of a line, spaces elsewhere
set nowrap              " nowrap lines
set backspace=2         " mode for backspace
set ffs=unix,dos,mac    " favor unix ff 
set formatoptions=tcroqn " see help (complex)
set formatoptions+=mM   " thus vim can reformat multibyte text (e.g. Chinese)
"----------------------------------------------------------------------------

" text formatting/layout
"----------------------------------------------------------------------------
set foldenable          " turn on folding
set foldmethod=marker   " make folding method: manual, indent, expr, marker, syntax, diff
set foldcolumn=0        " set fold column
set foldlevel=0       " don't autofold anything, but can still fold manually

"general
"set go=

"path and backspace
set nobackup                     " make backup file and leave it around
set nowb
set noswapfile


"general setting
syntax on
colo desert
"set relativenumber
"set colorcolumn=85

set bsdir=buffer
set autochdir
set completeopt=menu,preview

"mouse setting"
behave xterm

"fonts
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
if has("win32")
	set fileencoding=cp936
else
	set fileencoding=utf-8
endif
set enc=utf-8
let &termencoding = &encoding 
set guifont=Monaco:h10:cANSI
"set gfw=YouYuan:h10:cGB2312
set gfw=Yahei_Mono:h10.5:cGB2312
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" maps
let mapleader = ","
let g:mapleader=","

"Fast reloading of the _vimrc
map <silent> <leader>ss :source $vim/_vimrc<cr>
"Fast editing of _vimrc
map <silent> <leader>ee :e $vim/_vimrc<cr>
"When _vimrc is edited, reload it
autocmd! bufwritepost _vimrc source $vim/_vimrc
"Fast saving and quitting
nmap <leader>w :w!<cr>
nmap <leader>q :wq!<cr>
nmap <leader>x :q!<cr>
nmap <leader><space> :noh<cr>


"

"Easier matching bracket pairs
nnoremap <tab> %
vnoremap <tab> %

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nmap <space> <c-F>
nmap <s-space> <c-B>

"Quicker Escaping
"inoremap jk <esc>
"vnoremap kj <esc>
"cnoremap jk <esc>
"inoremap kj <esc>
"cnoremap kj <esc>
"
"Add comment# to multiline 
"map <leader>cm :s/^/#/<cr>:noh<cr>
"map <leader>nc :s/#//<cr>:noh<cr>

"Auto complete brackets
"imap [ []<left>
"imap ( ()<left>
"inoremap ' ''<Esc>i
"inoremap " ""<Esc>i
"imap {<enter> {<enter>}<Esc>0
"imap { {}<left>
"imap < <><left>

"Select all
nmap <c-a> ggVG
" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

" register
nnoremap Y "+y
vnoremap Y "+y
nnoremap P "+p
vnoremap P "+p
"nnoremap p "+P
"vnoremap p "+P
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" allow Alt-[movement keys] to scroll window
" need to modify lang/menu_chinese_gb.936.vim file as to Chinese menu
" delete the & in the Chinese menu
inoremap <m-h> <left>
inoremap <m-j> <C-o>gj
inoremap <m-k> <C-o>gk
inoremap <m-l> <right>
inoremap <m-H> <home>
inoremap <m-J> <c-x><c-e>
inoremap <m-K> <c-x><c-y>
inoremap <m-L> <end>
inoremap <m-{> <esc>{i
inoremap <m-}> <esc>}i
inoremap <m-_> <c-o>_
inoremap <m-.> <c-a>
"
" fastly move between words
inoremap <m-b> <C-o>b
inoremap <m-w> <C-o>w
"
" fastly move in command mode
cnoremap <m-h> <home>
cnoremap <m-l> <end>
cnoremap <m-w> <s-right>
cnoremap <m-b> <s-left>
cnoremap <m-j> <c-n>
cnoremap <m-k> <c-p>
cnoremap <m-J> <down>
cnoremap <m-K> <up>
"
noremap <m-H> <home>
noremap <m-J> <c-e>
noremap <m-K> <c-y>
noremap <m-L> <end>
"
" add blank line in insert and normal mode
inoremap <m-o> <c-g>u<esc>o
inoremap <m-O> <c-g>u<esc>O
noremap <m-o> o<esc>
noremap <m-O> O<esc>
"---------------------------------------

"Nicer statusline
"set laststatus=2
"set statusline=
"set statusline+=%2*%-3.3n%0*\                " buffer number
"set statusline+=%f\                          " file name
"set statusline+=%h%1*%m%r%w%0*               " flags
"set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
"set statusline+=%{&encoding},                " encoding
"set statusline+=%{&fileformat}]              " file format
"if filereadable(expand("$VIM/vimfiles/plugin/vimbuddy.vim"))
    "set statusline+=\ %{VimBuddy()}          " vim buddy
"endif
"set statusline+=%=                           " right align
"set statusline+=%2*0x%-8B\                   " current char
"set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset
"set wildmenu

" status line {
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ 
set statusline+=\ \ [%{&ff}/%Y] 
set statusline+=\ \ %<%20.30(%{CurDir()}%)\ 
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction

"}

"filetype off
"call pathogen#runtime_append_all_bundles() 
"filetype plugin indent on

"plugins
nmap <leader>ra :ToggleRaibowParenthesis<cr>
map <leader>vf :e $HOME\_pentadactylrc<cr>

nmap <leader>ra :ToggleRaibowParenthesis<cr>

"Minibuffer settings {

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 
map <leader>c :CMiniBufExplorer<cr>
map <leader>u :UMiniBufExplorer<cr>
map <leader>b :TMiniBufExplorer<cr>
"}


"NERD Tree
map <leader>t :NERDTreeToggle<cr>
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$']

"word completion
map <leader>cp :call DoWordComplete()<cr>
map <leader>nc :call EndWordComplete()<cr>
":autocmd BufEnter * call DoWordComplete()

"verilog staff
map <leader>md ma?^\s*\<module\><CR>Wyiw'a:echo "module -->" @0<CR>

" --- SuperTab
let g:SuperTabDefaultCompletionType = "context"

"insert current time
nmap <leader>d "=strftime('%c')<cr>p
imap <silent><leader>d <c-r>=strftime('%c')<cr>

let VCSCommandGitExec='c:\Program Files (x86)\Git\bin\git.exe'

" Yankring
nnoremap <silent> <leader>y :YRShow<cr>

"compview
nmap <leader>cv :CompView<cr>

"Calendar diary
nmap <leader>rl :Calendar<cr>
let g:calendar_list = [
        \   {'name': 'Tasks', 'path': '$HOME\tasks', 'ext': 'task'},
        \   {'name': 'Diary', 'path': '$HOME\diary', 'ext': 'diary'},
    \ ]
let g:calendar_current_idx = 1 
let g:calendar_monday = 1 "以星期一为开始 
let g:calendar_focus_today = 1 " 光标在当天的日期上 
let g:calendar_mark = 'left-fit' "可以让*和数字可靠近 
