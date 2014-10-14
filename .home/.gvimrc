set nu
set hlsearch
set incsearch

set history=100

set diffopt=iwhite


set et

syn on
filetype plugin indent on

set foldnestmax=12
set foldmethod=indent
"set foldcolumn=12
set foldlevel=12

set wildmenu
set wildmode=list:longest,full

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Courier\ New\ 9
  elseif has("gui_photon")
    set guifont=Courier\ New:s9
  elseif has("gui_kde")
    set guifont=Courier\ New/9/-1/5/50/0/0/0/1/0
  elseif has("x11")
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  else
    set guifont=Courier_New:h9:cDEFAULT
  endif
endif

set guioptions -=T
set guioptions -=r
set lines=999 columns=999

set shiftwidth=2
set tabstop=2

au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim

set backspace=indent,eol,start
set nocompatible


augroup gzip
  autocmd!
  autocmd BufReadPre,FileReadPre	*.gz set bin
  autocmd BufReadPost,FileReadPost	*.gz '[,']!gunzip
  autocmd BufReadPost,FileReadPost	*.gz set nobin
  autocmd BufReadPost,FileReadPost	*.gz execute ":doautocmd BufReadPost " . expand("%:r")
  autocmd BufWritePost,FileWritePost	*.gz !mv <afile> <afile>:r
  autocmd BufWritePost,FileWritePost	*.gz !gzip <afile>:r

  autocmd FileAppendPre		*.gz !gunzip <afile>
  autocmd FileAppendPre		*.gz !mv <afile>:r <afile>
  autocmd FileAppendPost		*.gz !mv <afile> <afile>:r
  autocmd FileAppendPost		*.gz !gzip <afile>:r
augroup END
