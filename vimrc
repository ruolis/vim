"###############################################################################
"
" System
"
"###############################################################################
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call system('mkdir -p ~/.vim/tmp/undodir ~/.vim/tmp/backupdir ~/.vim/tmp/directory ~/.vim/tmp/view')


"###############################################################################
"
" Basic
"
"###############################################################################
let $VIMFILES=$HOME.'./.vim'

colorscheme torte

set nocompatible

syntax on
syntax enable

set number
set relativenumber

set backup
set backupdir=~/.vim/tmp/backupdir

set autoread
set autowriteall

set novisualbell
set noerrorbells

set cursorline
set scrolloff=5
set nocursorcolumn

set wrap
set linebreak
set wrapmargin=2

set smarttab
set expandtab
set shiftround
set smartindent autoindent
set shiftwidth=4 tabstop=4 softtabstop=4

set hlsearch incsearch
set ignorecase smartcase

set showmatch
set laststatus=2
set backspace=indent,eol,start

set noautochdir
set ambiwidth=double

set wildmenu
" set completeopt=longest,menu
" set wildmode=longest,list,full

set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936 fileencoding=utf-8

set splitright
set splitbelow

set noshowcmd
set noshowmode
set matchtime=2

set viewoptions=cursor,folds,slash,unix

set complete-=i
set clipboard+=unnamed

filetype plugin indent on

set pastetoggle=<f5>

set undofile
set undodir=~/.vim/tmp/undodir

set viewdir=~/.vim/tmp/view
set viminfo+=n~/.vim/viminfo
set directory=~/.vim/tmp/directory


"###############################################################################
"
" Cursor
"
"###############################################################################
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"


"###############################################################################
"
" Basic Mapping
"
"###############################################################################
let mapleader=" "

nnoremap <silent> Q :q<cr>
nnoremap <silent> S :w<cr>
nnoremap <silent> <leader>w :w<cr>
nnoremap <silent> <leader>q :q<cr>
nnoremap <silent> R :source ~/.vim/vimrc<cr>
nnoremap <silent> <leader>rc :e ~/.vim/vimrc<cr>


"###############################################################################
"
" Other
"
"###############################################################################
nnoremap n nzz
nnoremap N Nzz
nnoremap <C-c> zz

nnoremap < <<
nnoremap > >>

nnoremap U <c-r>
inoremap jj <esc>`^
inoremap kk <esc>`^
nnoremap <silent> <leader><cr> :nohlsearch<cr>


"###############################################################################
"
" Tab Management
"
"###############################################################################
nnoremap tu :tabe<cr>
nnoremap tp :-tabnext<cr>
nnoremap tn :+tabnext<cr>


"###############################################################################
"
" Window Management
"
"###############################################################################
nnoremap <silent> <leader>k <C-w>k
nnoremap <silent> <leader>j <C-w>j
nnoremap <silent> <leader>h <C-w>h
nnoremap <silent> <leader>l <C-w>l

nnoremap s <nop>
nnoremap <silent> sj :set splitbelow<cr>:split<cr>
nnoremap <silent> sl :set splitright<cr>:vsplit<cr>
nnoremap <silent> sk :set nosplitbelow<cr>:split<cr>:set splitbelow<cr>
nnoremap <silent> sh :set nosplitright<cr>:vsplit<cr>:set splitright<cr>

nnoremap <silent> <leader><up> :res +5<cr>
nnoremap <silent> <leader><down> :res -5<cr>
nnoremap <silent> <leader><left> :vertical resize-5<cr>
nnoremap <silent> <leader><right> :vertical resize+5<cr>


"###############################################################################
"
" Cursor Movement
"
"###############################################################################
nnoremap <silent> H 0
nnoremap <silent> L $
nnoremap <silent> J 5j
nnoremap <silent> K 5k
nnoremap <silent> W 5w
nnoremap <silent> B 5b
nnoremap <silent> j gj
nnoremap <silent> k gk


"###############################################################################
"
" Plug Management
"
"###############################################################################
call plug#begin('~/.vim/plug')

Plug 'mhinz/vim-startify'
Plug 'preservim/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-better-whitespace'

Plug 'junegunn/fzf', { 'dir': '~/.vim/plug/fzf', 'do': './install' }
Plug 'junegunn/fzf.vim'

call plug#end()


"###############################################################################
"
" NERDTree
"
"###############################################################################
nnoremap <silent> <leader>f :NERDTreeFind<cr>
nnoremap <silent> <leader>t :NERDTreeToggle<cr>


"###############################################################################
"
" vim-better-whitespace
"
"###############################################################################
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0


"###############################################################################
"
" FZF
"
"###############################################################################
nnoremap <silent> <c-f> :Rg<cr>
nnoremap <silent> <c-p> :Files<cr>
nnoremap <silent> <c-l> :Lines<cr>
nnoremap <silent> <c-h> :History<cr>

let g:fzf_preview_window='right:60%'
let g:fzf_commits_log_options='--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
