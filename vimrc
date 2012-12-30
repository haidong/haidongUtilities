set nocompatible
set ignorecase smartcase
set linebreak
set autoindent
set smartindent
set showmatch
set cursorline
set cursorcolumn
set backupdir=$HOME/Documents/vimBackup

colorscheme morning

call pathogen#infect()
syntax on
filetype plugin indent on
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4

:iabbrev ms Microsoft
:iabbrev wi Windows
:iabbrev db database
:iabbrev tb table
:iabbrev ix index
:iabbrev sp stored procedure
:iabbrev sl select
:iabbrev ud update
:iabbrev dl delete
:iabbrev fr from
:iabbrev cr create
:iabbrev al alter
:iabbrev bk backup
:iabbrev rs restore
:iabbrev dk disk
:iabbrev fl file
:iabbrev ss SQL Server
:iabbrev s5 SQL Server 2005
:iabbrev s8 SQL Server 2008
:iabbrev s12 SQL Server 2012
