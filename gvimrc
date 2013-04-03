set guioptions-=T
set guioptions-=m
set mousemodel=popup_setpos
set ballooneval
if has('win32')
	set guifont=Consolas:h16:cANSI
elseif has('unix')
	set guifont=DejaVu\ Sans\ Mono\ 18
endif

behave mswin
