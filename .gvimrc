set guioptions-=T
set guioptions-=m
set mousemodel=popup_setpos
set ballooneval
if has('win32')
	set guifont=Consolas:h16:cANSI
elseif has('unix')
	set guifont=DejaVu\ Sans\ Mono\ 18
endif

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
