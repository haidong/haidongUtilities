set nocompatible
set ignorecase smartcase
set linebreak
set autoindent
set showmatch
set cursorline
set cursorcolumn
set backupdir=$HOME/Documents/vimBackup

"colorscheme morning

call pathogen#infect()
syntax on
filetype plugin indent on
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4|set textwidth=80
