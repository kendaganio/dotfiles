" Disable vi compatibility
set nocompatible 

" Large history buffer 
set history=256  

" Automatically track changes to buffers
set autoread  

set clipboard+=unnamed  " Yanks go on clipboard instead.
set pastetoggle=<F2> "  toggle between paste and normal: for 'safer' pasting from keyboard

" Backup
set nowritebackup
set nobackup
set directory=/tmp// " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)

" Buffers
set hidden " The current buffer can be put to the background without writing to disk

" Match and search
set hlsearch    " highlight search
set ignorecase  " Do case in sensitive matching with
set smartcase		" be sensitive when there's a capital letter
set incsearch   "
" "}}}

set nowrap
set textwidth=0		" Don't wrap lines by default
set wildmode=longest,list " At command line, complete longest common string, then list alternatives.

set backspace=indent,eol,start	" more powerful backspacing

set tabstop=2    " Set the default tabstop
set softtabstop=2
set shiftwidth=2 " Set the default shift width for indents
set expandtab   " Make tabs into spaces (set by tabstop)
set smarttab " Smarter tab levels

call pathogen#infect() 
syntax on
filetype plugin indent on

" Key bindings

let mapleader=','

inoremap jk <esc>
vnoremap jk <esc>

nnoremap ; :
nnoremap // :nohlsearch<cr>
nnoremap <leader>rs :source $MYVIMRC<cr>

nnoremap <leader>d :NERDTreeToggle<cr>

" Ui stuff
if has('gui_running')
  set background=dark
  set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 10
  set guioptions=aem
  colorscheme base16-monokai
endif

let g:Powerline_symbols = 'fancy'
