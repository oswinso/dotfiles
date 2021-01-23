set nocompatible
filetype off

"""""""""""""""""""" Plugins and plugin settings """"""""""""""""""""

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Utilities
Plugin 'tpope/vim-commentary'

" Look and feel
Plugin 'altercation/vim-colors-solarized'

Plugin 'dense-analysis/ale'

Plugin 'psf/black'

Plugin 'preservim/nerdcommenter'

Plugin 'neoclide/coc.nvim'

filetype plugin indent on
syntax on

" vim-plug fzf
call plug#begin()
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
call plug#end()
" vim-plug end

set showmode
set showcmd

" Misc
Plugin 'mtth/scratch.vim'

call vundle#end()

execute pathogen#infect()
set rtp+=~/.fzf

" Run Black on Save
autocmd BufWritePre *.py execute ':Black'

"""""""""""""""""""" General vim settings """"""""""""""""""""

" Syntax highlighting
set t_Co=256
set background=dark
colorscheme solarized
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
syntax enable

" General settings
set number
set scrolloff=3
set sidescrolloff=5
set laststatus=2
set ttimeoutlen=50

set showcmd
set showmatch
set showmode
set ruler
set formatoptions+=o

set title

" Whitespace setting
set textwidth=0
set expandtab
set shiftwidth=2
set tabstop=2

set noerrorbells
set modeline
set esckeys
set linespace=0
set nojoinspaces

set splitbelow

" Search settings
set hlsearch
set incsearch
set magic
set hidden

" Key bindings
let mapleader = " "
nnoremap <silent> <Leader><Space> :Files<CR>
nnoremap <silent> <Leader>. :Files <C-r>=expand("%:h")<CR>/<CR>
nnoremap <Leader>rg :Rg<Space>
nnoremap <Leader>RG :Rg!<Space>


" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬

call pathogen#helptags()

set completeopt+=menuone
set completeopt+=noselect
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion

let g:mucomplete#enable_auto_at_startup = 1
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:racer_cmd = "/home/oswinso/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:ycm_autoclose_preview_window_after_completion = 0

:set number relativenumber
:set nu rnu

"""""""""""""""""""""""""" Coc Stuff """""""""""""""""""""""""""""""
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=co

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

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

""""""""""""""""""""""""""" Key-bindings """"""""""""""""""""""""""""

" Use space as the leader
let mapleader = "\<SPACE>"

" Fix movement with overflowing lines
nnoremap j gj
nnoremap k gk

nnoremap / /\v
vnoremap / /\v

" Easier split navigation.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" Use Tab and Shift Tab to navigate between tabs.
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" Next / Prev ALE error
nmap <silent> gn :ALENext<cr>

" Control slash to comment out sections.
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv


" Clear the search with <leader>/
nnoremap <leader>/ :nohlsearch<CR>

