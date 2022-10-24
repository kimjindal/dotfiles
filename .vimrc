set nocompatible
filetype plugin indent on
call plug#begin('~/.vim/plugged')
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'triglav/vim-visual-increment'
" Plug 'itchyny/lightline.vim'
" Plug 'tpope/vim-surround'
" Plug 'scrooloose/nerdtree'
" Plug 'tpope/vim-commentary'
" Plug 'kana/vim-textobj-user'
" Plug 'jiangmiao/auto-pairs'
" Plug 'justinmk/vim-sneak'
" Plug 'mattn/emmet-vim'
" Plug 'alvan/vim-closetag'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   General Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set hidden
set history=256
set nrformats=
set ruler
set showmatch
set mouse=n
set showcmd
set wmnu
set number
set laststatus=2
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set signcolumn=yes
set undodir=~/.vim/undodir
set undofile
set ignorecase
set smartcase
set hlsearch
set incsearch
set shortmess-=S
set shortmess+=c
set belloff+=ctrlg
set completeopt+=menuone,noinsert,longest
set backspace=indent,eol,start
set termguicolors
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set ai
set si

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Key Mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>h :nohlsearch<CR>
nmap <Leader>j o<Esc>
imap jk <C-[>
vmap jk <Esc>
nmap <Leader>w :write<CR>
nmap <Leader>c :q<CR>
imap <C-f> <C-o>l
imap <C-b> <C-o>h
nmap <S-l> :bnext<CR>
nmap <S-h> :bprevious<CR>
nmap <A-j> <Esc>:m .+1<CR>==
nmap <A-k> <Esc>:m .-2<CR>==
vmap J :move >+1<CR>gv-gv
vmap K :move '<-2<CR>gv-gv
vmap < <gv
vmap > >gv
vmap p -dP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Resizing Windows
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <S-Up> <C-w>+
nnoremap <S-Down> <C-w>-
nnoremap <S-Right> <C-w>>
nnoremap <S-Left> <C-w><
