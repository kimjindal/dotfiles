call plug#begin('~/AppData/Local/nvim/plugged')

" File and folder management
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'natebosch/dartlang-snippets'

" Language support
Plug 'tpope/vim-projectionist'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'romgrk/nvim-treesitter-context'
Plug 'andymass/vim-matchup'
Plug 'windwp/nvim-ts-autotag'
Plug 'sheerun/vim-polyglot' " Saves from a lot unforeseen indent headaches

" Editing tools
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'justinmk/vim-sneak'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'easymotion/vim-easymotion'

" Dart
Plug 'dart-lang/dart-vim-plugin'

" Typescript
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'

" Git
Plug 'tpope/vim-fugitive'

" Theme
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
call plug#end()

set termguicolors
set nocompatible
set encoding=UTF-8
set number
set hidden
set nowrap
set hlsearch
set noswapfile
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set undodir=~/AppData/Local/nvim-data/backup
set undofile
set incsearch
set tabstop=2
set ignorecase 
set softtabstop=0 noexpandtab
set shiftwidth=2
set colorcolumn=120
set shortmess+=c
set shortmess-=S
set mouse=a
set belloff+=ctrlg
set cursorline

syntax on
filetype plugin indent on
colorscheme gruvbox
" let g:airline_theme='onedark'
highlight ColorColumn ctermbg=238

let mapleader="\<Space>"
nnoremap <leader>; :nohlsearch<CR>
nnoremap <C-l> :NERDTreeToggle<CR>
nnoremap <leader>fe :CocCommand flutter.emulators <CR>
nnoremap <leader>fd :below new output:///flutter-dev <CR>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
map <leader><leader>h :wincmd h <CR>
map <leader><leader>j :wincmd j <CR>
map <leader><leader>k :wincmd k <CR>
map <leader><leader>l :wincmd l <CR>
nmap <CR> o<Esc>

let g:dart_format_on_save = 1
let g:dartfmt_options = ['--fix', '--line-length 120']

" Auto-Pairs meta key mapping
let g:AutoPairsFlyMode = 1	
let g:AutoPairsShortcutJump = '<C-j>'

" Move cursor forward, backword
imap <C-f> <C-o>l
imap <C-b> <C-o>h

" Easymotion key mapping
map <leader>l <plug>(easymotion-bd-jk)
map <leader>w <plug>(easymotion-bd-w)

" Resizing Windows
nnoremap <S-up> <C-w>+
nnoremap <S-Down> <C-w>-
" nnoremap <S-Right> <C-w>>
" nnoremap <S-Left> <C-w><

nmap <C-P> :FZF<CR>

nmap <leader>gs :G<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gl :diffget //3<CR>

let g:NERDTreeGitStatusWithFlags = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#left_sep=''
let g:airline#extensions#tabline#left_alt_sep='|'

" == Begin : Coc.nvim Configuration ~p275 ==================================== 
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-flutter',
  \ 'coc-snippets',
  \ 'coc-yaml',
  \ 'coc-tslint-plugin',
  \ 'coc-emmet',
  \ 'coc-css',
  \ 'coc-html',
  \ ]

" let g:coc_snippet_next = ''
" let g:coc_snippet_prev = ''
" inoremap <expr> <c-j>
"    \ pumvisible() ? "\<c-n>" :
"    \ coc#jumpable() ? "\<c-r>=coc#rpc#request('snippetNext', [])<cr>" :
"    \ "\<c-j>"
" inoremap <expr> <c-k>
"    \ pumvisible() ? "\<c-p>" :
"    \ coc#jumpable() ? "\<c-r>=coc#rpc#request('snippetPrev', [])<cr>" :
"    \ "\<c-k>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() 
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format  :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold    :call CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR      :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^={coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CocList
nnoremap <silent> <space><space>' :<C-u>CocFzfList<CR>
" == END : Coc.vim Configuration p136~ ==================================== 

" == AUTOCMD ==================================== 
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

" == Fix clashed cursor ================================
nnoremap <leader><leader>; :set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20<CR>

" == Coc and Easymotion Conflict ================
autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable

" == Nvim Checkhealth Error Pass ================
let g:ruby_host_prog = '/usr/local/lib/ruby/gems/3.0.0/bin/neovim-ruby-host'
" let g:perl_host_prog = '/usr/bin'
" let g:python_host_prog  = 'usr/bin'
let g:python3_host_prog  = '/usr/local/bin/python3' 
let g:loaded_perl_provider = 0
let g:loaded_python_provider = 0

" == Configuration nvim-treessitter-modules ================
lua <<EOF
require'nvim-treesitter.configs'.setup {
	ensure_installed = 'maintained',
  sync_install = false,
	ignore_install = { '' },
	highlight = { enable = true },
	indent = { enable = false },
	incremental_selection = { enable = true },
  matchup = { enable = true },
}

require('nvim-ts-autotag').setup()

require'treesitter-context'.setup {
  enable = true,
  throttle = true,
  max_lines = 0,
  patterns = {
    default = {
      'class',
      'function',
      'method'
    }
  }
}
EOF

" == Emmet Configuration ================
" Only enable in html and css (not js)
let g:user_emmet_install_global = 0
autocmd Filetype html,css EmmetInstall
autocmd FileType html set makeprg=firefox-nightly\ %

