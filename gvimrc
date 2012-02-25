set nocompatible
set ignorecase smartcase
set linebreak
set autoindent
set smartindent
set showmatch
set cursorline
set cursorcolumn
set guioptions-=T
set guioptions-=m
set mousemodel=popup_setpos
set ballooneval
if has('win32')
	set guifont=Consolas:h16:cANSI
elseif has('unix')
	set guifont=DejaVu\ Sans\ Mono\ 18
endif
set backupdir=$HOME/Documents/vimBackup

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

map ,t  <Esc>:!prove -vl %<CR>
set diffexpr=MyDiff()

:inoremap ( ()<ESC>i
:inoremap < <><ESC>i
:inoremap { {}<ESC>i
:inoremap [ []<ESC>i
:inoremap " ""<ESC>i

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
:iabbrev s0 SQL Server 2000
:iabbrev s5 SQL Server 2005
:iabbrev s8 SQL Server 2008


function MyDiff()
 let opt = '-a --binary '
 if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
 if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
 let arg1 = v:fname_in
 if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
 let arg2 = v:fname_new
 if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
 let arg3 = v:fname_out
 if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
 if &sh =~ '\<cmd'
   silent execute '!""C:\Program Files\Vim\vim70\diff" ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . '"'
 else
   silent execute '!C:\Program" Files\Vim\vim70\diff" ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
 endif
endfunction

map <silent> <C-F2> :if &guioptions =~# 'T' <Bar>
\set guioptions-=T <Bar>
\set guioptions-=m <bar>
\else <Bar>
\set guioptions+=T <Bar>
\set guioptions+=m <Bar>
\endif<CR>


function! FoldSpellBalloon()
let foldStart = foldclosed(v:beval_lnum )
let foldEnd = foldclosedend(v:beval_lnum)
let lines = []
" Detect if we are in a fold
if foldStart < 0
" Detect if we are on a misspelled word
let lines = spellsuggest( spellbadword(v:beval_text)[ 0 ], 5, 0 )
else
" we are in a fold
let numLines = foldEnd - foldStart + 1
" if we have too many lines in fold, show only the first 14
" and the last 14 lines
if ( numLines > 31 )
let lines = getline( foldStart, foldStart + 14 )
let lines += [ '-- Snipped ' . ( numLines - 30 ) . ' lines --' ]
let lines += getline( foldEnd - 14, foldEnd )
else
"less than 30 lines, lets show all of them
let lines = getline( foldStart, foldEnd )
endif
endif
" return result
return join( lines, has( "balloon_multiline" ) ? "\n" : " " )
endfunction
set balloonexpr=FoldSpellBalloon()

function! SuperCleverTab()
"check if at beginning of line or after a space
if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
return "\<Tab>"
else
" do we have omni completion available
if &omnifunc != ''
"use omni-completion 1. priority
return "\<C-X>\<C-O>"
elseif &dictionary != ''
" no omni completion, try dictionary completio
return ¡°\<C-K>¡±
else
"use omni completion or dictionary completion
"use known-word completion
return "\<C-N>"
endif
endif
endfunction
" bind function to the tab key
inoremap <Tab> <C-R>=SuperCleverTab()<cr>

