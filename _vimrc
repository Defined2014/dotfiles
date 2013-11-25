" Vendle config {
    set nocompatible              " be iMproved
    filetype off                  " required!

    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    " let Vundle manage Vundle
    " required! 
    Bundle 'gmarik/vundle'
    Bundle 'scrooloose/nerdtree'
    Bundle 'vim-scripts/taglist.vim'
    Bundle 'bling/vim-airline'
    Bundle 'vim-scripts/a.vim'

    " My bundles here:
    " Bundle 'taglist'
    " original repos on GitHub
    " Bundle 'tpope/vim-fugitive'
    " Bundle 'Lokaltog/vim-easymotion'
    " Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
    " vim-scripts repos
    " Bundle 'L9'
    " Bundle 'FuzzyFinder'
    " non-GitHub repos
    " Bundle 'git://git.wincent.com/command-t.git'
    " Git repos on your local machine (i.e. when working on your own plugin)
    " Bundle 'file:///Users/gmarik/path/to/plugin'
    " ...

    filetype plugin indent on     " required!
    "
    " Brief help
    " :BundleList          - list configured bundles
    " :BundleInstall(!)    - install (update) bundles
    " :BundleSearch(!) foo - search (or refresh cache first) for foo
    " :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
    "
    " see :h vundle for more details or wiki for FAQ
    " NOTE: comments after Bundle commands are not allowed.
" }

" General {
    set nocompatible
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    scriptencoding utf-8
" }

" Vim UI {
    set nu
    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode
    set cursorline                  " Highlight current line
    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set list
    set laststatus=2
    "set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
" }
" Formatting {
    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
" }
" Key Map {
    let mapleader = ","
    map <Leader>n :NERDTreeToggle<CR>
    map <Leader>t :TlistToggle<CR>
    map <Leader>a :A<CR>
    map <Leader>v :AV<CR>
" }
" TagList {
    set tags=tags;
    set autochdir
" }
