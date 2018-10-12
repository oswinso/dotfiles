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

let g:syntastic_java_checkers = ['checkstyle', 'javac']
let g:syntastic_java_checkstyle_classpath = '~/checkstyle-8.12-all.jar'
let g:syntastic_java_checkstyle_conf_file = '~/cs1331_checkstyle.xml'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" see :h syntastic-loclist-callback
function! SyntasticCheckHook(errors)
    if !empty(a:errors)
        let g:syntastic_loc_list_height = min([len(a:errors), 10])
    endif
endfunction

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

set rtp+=~/.fzf
