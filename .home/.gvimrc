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

set guifont=courier
set guioptions -=T
set guioptions -=r
set lines=999 columns=999

set shiftwidth=2
set tabstop=2

au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim
