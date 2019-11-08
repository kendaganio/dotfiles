call plug#begin('~/.vim/plugged')

" Basics
Plug 'scrooloose/nerdtree'
Plug 'rking/ag.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'SirVer/ultisnips'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'

" tpope section
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-dispatch'

" fzf is <3
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Syntax
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'neoclide/coc-solargraph', {'do': 'yarn install --frozen-lockfile'}

" Pretty Stuff
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Other stuff
Plug 'shime/vim-livedown'

call plug#end()

set nocompatible " Disable vi compatibility
set encoding=utf8 " Set encoding
set history=256  " Large history buffer

set clipboard=unnamedplus  " Yanks go on clipboard instead.
set pastetoggle=<F2> "  toggle between paste and normal: for 'safer' pasting from keyboard

" Backup
set nobackup
set noswapfile
set nowb
set directory=/tmp// " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)
set viminfo=""

" Display tabs and trailing spaces visually
set list listchars=tab:→\ ,trail:·

" Buffers
set autoread " Automatically track changes to buffers
set hidden " The current buffer can be put to the background without writing to disk
set laststatus=2

" Match and search
set hlsearch    " highlight search
set ignorecase  " Do case in sensitive matching with
set smartcase		" be sensitive when there's a capital letter
set incsearch   " searches before pressing enter

set nowrap
set textwidth=0		" Don't wrap lines by default
set wildignore+=node_modules
set wildignore+=log,logs
set wildignore+=vendor
set wildmode=longest,list " At command line, complete longest common string, then list alternatives.
set cc=80

set backspace=indent,eol,start	" more powerful backspacing

set tabstop=2    " Set the default tabstop
set softtabstop=2
set shiftwidth=2 " Set the default shift width for indents
set expandtab   " Make tabs into spaces (set by tabstop)
set smarttab " Smarter tab levels

" Syntax highlighting
syntax on
filetype plugin indent on
set cursorline

set fillchars+=vert:\

autocmd BufWritePre *.rb,*.js,*.jsx,*.slim,*.css,*.scss :%s/\s\+$//e " Remove trailing whitespaces

" UI colors
let &t_Co = 256 " Set 256 Colors
let base16colorspace=256
set background=dark
colorscheme base16-oceanicnext

" Key bindings
let mapleader=','
inoremap jk <esc>
nnoremap // :nohlsearch<cr>
nnoremap <leader>rs :source $MYVIMRC<cr>
nnoremap <leader>w :w<enter>
nnoremap <leader>x :bd<enter>
nnoremap <leader>d :NERDTreeToggle<cr>
nnoremap <leader>a :Ag ''<Left>
nnoremap <C-p> :FZF<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>gb :Gblame<cr>

" Buffer Controls
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap vv <C-w>v
nnoremap ss <C-w>s
nnoremap <C-n> :bnext<cr>

" Custom config stuff
let g:airline_theme = 'luna'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = "\ue0bc "
let g:airline#extensions#tabline#right_sep = "\ue0be"
let g:airline#extensions#tabline#left_alt_sep = " "
let g:airline_left_sep="\ue0b8"
let g:airline_right_sep="\ue0ba"
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
let g:UltiSnipsSnippetsDirectorires = ["~/.vim/UltiSnips", "UltiSnips"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" JS Config shit
let g:jsx_ext_required = 0
let g:javascript_plugin_jsdoc= 1

" ALE
" \  'ruby': ['rubocop'],
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
\  'javascript': ['eslint'],
\  'ruby': ['rubocop'],
\}
" \  'ruby': ['standardrb'],
let g:ale_fixers = {
\  'javascript': ['prettier'],
\}
let g:ale_fix_on_save = 1
let g:ale_set_highlights = 0
