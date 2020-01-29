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

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set rtp+=~/.local/lib/python3.6/site-packages/powerline/bindings/vim

" Language support
Plugin 'elixir-lang/vim-elixir'
Plugin 'uarun/vim-protobuf'
Plugin 'rust-lang/rust.vim'
Plugin 'davidzchen/vim-bazel'
Plugin 'keith/swift.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'cstrahan/vim-capnp'

" Misc
Plugin 'mtth/scratch.vim'

call vundle#end()

execute pathogen#infect()
set rtp+=~/.fzf

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

""""""""""""""""""""""""""" Key-bindings """"""""""""""""""""""""""""

" Use space as the leader
let mapleader = "\<SPACE>"

" Fix movement with overflowing lines
nnoremap j gj
nnoremap k gk

nnoremap / /\v
vnoremap / /\v

" Clear the search with <leader>/
nnoremap <leader>/ :nohlsearch<CR>

