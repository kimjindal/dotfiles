set nocompatible
filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim plugin manager (vim-plug) and installed plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set rtp+=/usr/local/opt/fzf
" set rtp+=/usr/local/bin/fzf
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'triglav/vim-visual-increment'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'kana/vim-textobj-user'
Plug 'editorconfig/editorconfig-vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'tpope/vim-abolish'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'haya14busa/is.vim'
Plug 'vim-scripts/AutoComplPop'
Plug 'morhetz/gruvbox'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'justinmk/vim-sneak'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'easymotion/vim-easymotion'
" Plug 'lifepillar/vim-mucomplete'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   General Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets title bar string
" set title
" set titlestring=%F

set encoding=utf-8
set hidden
" Sets history line
set history=256
" Sets all numerals as decimal
set nrformats=
" Mapping <leader> => ,
let mapleader=" "
" Show current position at bottom-right
set ruler
" Show matching brackets when text indicator is over them
set showmatch
set mouse=n
set showcmd
" Show Tap Autocomplete list
set wmnu
" Set line number relative
set number
" set relativenumber
set laststatus=2

set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
" set signcolumn=yes

set undodir=~/.vim/undodir
set undofile
 
" Enable matchit plugin
runtime macros/matchit.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Search and Word Complete Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore case when searching
set ignorecase
" Be smart when searching
set smartcase
" Highlight search last result
set hlsearch
" Move cursor when searching
set incsearch
" Show count of matches
set shortmess-=S
" Shut off completion message
set shortmess+=c
" Add only if vim beeps during completion
set belloff+=ctrlg
" set wildmode=longest,list
" set complete+=kspell
set completeopt+=menuone,noinsert,longest
set backspace=indent,eol,start

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Color Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax Enable
set termguicolors
syntax on

let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\    'Search': { 'guifg': '000000', 'guibg': 'f2ed6f',
\                    'ctermfg': 'Magenta', 'ctermbg': 'Yellow' },
\}
if has('termguicolors') && &termguicolors
    let g:jellybeans_overrides['background']['guibg']='none'
endif
let g:lightline = {'colorscheme' : 'jellybeans'}
colorscheme jellybeans

" " Use color scheme 'gruvbox'
" " set background=light 
" " let g:gruvbox_contrast_light='medium'
" set background=dark
" let g:gruvbox_contrast_dark='hard'
" let g:lightline = {'colorscheme' : 'gruvbox'}
" colorscheme gruvbox
" " highlight Normal ctermbg=16 guibg=#000000

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Indent Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab

" Auto Indent
set ai
" Smart Indent
set si

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Key Mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>; :nohlsearch<CR>

" Insert newline on normal mode (without entering insert mode)
" nmap <S-Enter> i<CR><Esc>
nmap <CR> o<Esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Moving The Buffer List or quickly toggle <C-^>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Resize Split Windows 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <Up>       :resize +2<CR>
" nnoremap <Down>     :resize -2<CR>
" nnoremap <Left>     :vertical resize +2<CR>
" nnoremap <Right>    :vertical resize -2<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Easy Expansion of the Active File Directory
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 마지막으로 수정된 곳에 커서를 위치함
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Cursor Mode Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" View diff between current buffer and original file
" Rewrite a function ($VIMRUNTIME/default.vim,:DiffOrig)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>df :call DiffOrig()<CR>

function! DiffOrig()
    if !exists("b:diff_active") && &buftype == "nofile"
        echoerr "E: Cannot diff a scratch buffer"
        return -1
    elseif expand("%") == ""
        echoerr "E: Buffer doesn't exist on disk"
        return -1
    endif

    if !exists("b:diff_active") || b:diff_active == 0
        let b:diff_active = 1
        let l:orig_filetype = &l:filetype

        leftabove vnew
        let t:diff_buffer = bufnr("%")
        set buftype=nofile

        read #
        0delete_
        let &l:filetype = l:orig_filetype

        diffthis
        wincmd p
        diffthis
    else
        diffoff
        execute "bdelete " . t:diff_buffer
        let b:diff_active = 0
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto indent by vim-jsbeautify
" Config File : ~/.vim/.editorconfig
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType javascript vnoremap <buffer> <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto-Pairs meta key mapping
" jiangmiao/auto-pairs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoPairsFlyMode = 1
imap <C-y>e <M-e>
imap <C-y>p <M-p>
imap <C-y>n <M-n>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move cursor forward, backword in insert mode without arrow key 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <C-f> <C-o>l
imap <C-b> <C-o>h
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" junegunn/fzf.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping selecting mapping
" nmap <leader><tab> <plug>(fzf-maps-n)
" Insert mode completion
" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-l> <plug>(fzf-complete-line)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Semantic Higlight Toggle
" jaxbot/semantic-highlight.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>s :SemanticHighlightToggle<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Customize the grep to the ack program 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set grepprg=ack\ --nogroup\ --column\ $*
set grepformat=%f:%l:%c:%m

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search for the current visual selection
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch(cmdtype)
    let temp = @s
    norm! gv"sy 
    let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
    let @s = temp
endfunction 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Resizing Windows
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <S-Up> <C-w>+
nnoremap <S-Down> <C-w>-
nnoremap <S-Right> <C-w>>
nnoremap <S-Left> <C-w><

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easymotion key mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
" nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
" nmap <Leader>w <Plug>(easymotion-overwin-w)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set configuration for vim-mucomplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:mucomplete#enable_auto_at_startup = 1
" let g:mucomplete#completion_delay = 1
