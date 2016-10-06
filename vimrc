call plug#begin('~/.vim/plugged')

" Basics
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'
Plug 'ddollar/nerdcommenter'
Plug 'rking/ag.vim'
Plug 'christoomey/vim-tmux-navigator'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Pretty Stuff
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'

" Syntax
Plug 'slim-template/vim-slim'
Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] }
Plug 'kchmck/vim-coffee-script'
Plug 'elixir-lang/vim-elixir'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" Other stuff
Plug 'shime/vim-livedown'

call plug#end()

set nocompatible " Disable vi compatibility
set encoding=utf8 " Set encoding

set history=256  " Large history buffer

set autoread " Automatically track changes to buffers

set clipboard+=unnamed  " Yanks go on clipboard instead.
set pastetoggle=<F2> "  toggle between paste and normal: for 'safer' pasting from keyboard

" Backup
set nobackup
set noswapfile
set nowb
set directory=/tmp// " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)

" Display tabs and trailing spaces visually
set list listchars=tab:→\ ,trail:·

" Buffers
set hidden " The current buffer can be put to the background without writing to disk
set laststatus=2

" Match and search
set hlsearch    " highlight search
set ignorecase  " Do case in sensitive matching with
set smartcase		" be sensitive when there's a capital letter
set incsearch   " searches before pressing enter

set nowrap
set textwidth=0		" Don't wrap lines by default
set wildmode=longest,list " At command line, complete longest common string, then list alternatives.

set backspace=indent,eol,start	" more powerful backspacing

set tabstop=2    " Set the default tabstop
set softtabstop=2
set shiftwidth=2 " Set the default shift width for indents
set expandtab   " Make tabs into spaces (set by tabstop)
set smarttab " Smarter tab levels

" Syntax highlighting
syntax on
filetype plugin indent on

set fillchars+=vert:\ 

autocmd BufWritePre *.rb,*.js,*.jsx,*.slim,*.css,*.scss :%s/\s\+$//e " Remove trailing whitespaces

" UI colors
let &t_Co = 256 " Set 256 Colors
set background=dark
colorscheme base16-ocean

" Key bindings
let mapleader=','
inoremap jk <esc>
nnoremap ; :
nnoremap // :nohlsearch<cr>
nnoremap <leader>rs :source $MYVIMRC<cr>
nnoremap <leader>w :w<enter>

nnoremap <leader>d :NERDTreeToggle<cr>
nnoremap <leader>a :Ag 

nnoremap <C-p> :FZF<cr>

nnoremap <leader>gb :Gblame<cr>

" Buffer moving
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Buffer splitting
nnoremap vv <C-w>v
nnoremap ss <C-w>s

" Custom config stuff
let g:airline_theme = 'luna'
let g:airline_left_sep=''
let g:airline_right_sep=''

let g:javascript_plugin_jsdoc=1

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
