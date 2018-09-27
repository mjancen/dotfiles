" ##### VUNDLE CONFIG #####
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Add your own plugins here
"################################################## 
Plugin 'scrooloose/nerdtree'        " file explorer
Plugin 'vim-latex/vim-latex'        " LaTeX bindings
"################################################## 

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

colorscheme srcery

let mapleader = ","         " remaps leader key

set number                  " line numbering
set ruler                   " show position in file
set t_Co=256                " used to properly display colorschemes
syntax enable               " enable syntax processing

set tabstop=4               " num spaces in visual tabs
set softtabstop=4           " num spaces per tab when editing
set expandtab               " tabs converted to spaces when editing
set autoindent              " newlines stay on current indent level
set smartindent             " indents after colons and brackets
                            " not as flexible as filetype indentation
set shiftwidth=4            " num of spaces used when shifting with >>, <<, etc

set showcmd                 " shows last entered command
set cursorline              " higlights line where cursor is
set lazyredraw              " redraw screen only when necessary
set showmatch               " highlights matching brackets {[()]}

set incsearch               " search as you enter characters
set hlsearch                " highlight matches
nnoremap <leader><space> :nohlsearch<CR>    " stop search highlighting

set foldenable              " enable folding
set foldlevelstart=10       " opens most folds by default
set foldnestmax=10          " 10 nested fold max
nnoremap <space> za         " space opens/closes folds
set foldmethod=indent       " folds indented blocks


" Insert timestamp shortcut
nnoremap tt "=strftime("%Y-%m-%d, %a")<CR>P
" inoremap tt <C-R>=strftime("%Y-%m-%d, %a")<CR>


" NerdTree config
"############################################################
map <C-n> :NERDTreeToggle<CR>   " Ctrl+N to toggle NERDTree
" Close Vim if NERDTree is the last thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Vim-Latex config
"############################################################
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
" set shellslash

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
