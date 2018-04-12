call plug#begin('~/.vim/plugged')

" Basics
Plug 'scrooloose/nerdtree'
Plug 'ddollar/nerdcommenter'
Plug 'rking/ag.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'SirVer/ultisnips'

" tpope section
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-dispatch'

" fzf is <3 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Pretty Stuff
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'Yggdroot/indentLine'

" Syntax 
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'editorconfig/editorconfig-vim'

" Other stuff
Plug 'shime/vim-livedown'
Plug 'easymotion/vim-easymotion'

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

" Buffer Controls
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap vv <C-w>v
nnoremap ss <C-w>s

" Custom config stuff
let g:airline_theme = 'luna'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:indentLine_char = '▏'
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
let g:UltiSnipsSnippetsDirectorires = ["~/.vim/UltiSnips", "UltiSnips"]
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:indentLine_fileTypeExclude = ['json', 'markdown'] 

" JS Config shit
let g:jsx_ext_required = 0
let g:javascript_plugin_jsdoc= 1

