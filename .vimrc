set nocompatible
set ignorecase smartcase
set wildignorecase
set linebreak
set autoindent
set showmatch
set hlsearch
set cursorline
set cursorcolumn
" set diffopt+=iwhite
set backupdir=$HOME/Documents/vimBackup
set tags=tags;
set foldmethod=syntax
au BufWinEnter * normal zR

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

syntax on
filetype plugin indent on
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4|set textwidth=80
autocmd FileType sql set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
