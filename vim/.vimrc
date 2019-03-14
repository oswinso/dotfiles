execute pathogen#infect()
set nocompatible
set autoindent
set modelines=0
set number
set ttyfast
set laststatus=2

set exrc
set secure

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set rtp+=~/.local/lib/python3.6/site-packages/powerline/bindings/vim
filetype plugin indent on
syntax on

set showmode
set showcmd

set ruler

set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set noshiftround
set fo+=t

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:>
runtime! macros/matchit.vim

nnoremap j gj
nnoremap k gk

set hidden

nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> : let @/=''<cr> "clear search

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬

" Color scheme
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

set rtp+=~/.fzf
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
