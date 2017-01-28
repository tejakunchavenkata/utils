"
" General settings
"
set nu
set hlsearch
set incsearch
set history=100
set diffopt=iwhite
" Tab expansion settings
set et
set shiftwidth=2
set tabstop=2
set backspace=indent,eol,start
set nocompatible
syn on
filetype plugin indent on

" Fold code inside loops or functions
set foldnestmax=12
set foldmethod=indent
set foldlevel=12
"set foldcolumn=12

" Auto suggest word completions
set wildmenu
set wildmode=list:longest,full

" VIM font settings
if has("gui_running")
  set guifont=Courier\ 10\ Pitch\ 9
endif

" Simplyfy VIM, by removing buttons/scrollbar
set guioptions -=T
set guioptions -=r

" Always in fullscreen
set lines=999 columns=999

" Makes vim very slow
" Highlight current column and line
" set cursorline
" hi CursorLine guibg=#eeeeee
" set cursorcolumn
" hi CursorColumn guibg=#eeeeee

" Setings to control too many characters in a single line
set nowrap

" Maximum line size allowed
set textwidth=100
set formatoptions+=t

" Colors the given column
highlight ColorColumn ctermbg=2 guibg=#eeeeee
let &colorcolumn=join(range(101,999),",")

" How do I read zip files in vim directly, without unzipping
augroup gzip
  autocmd!
  autocmd BufReadPre,FileReadPre	    *.gz set bin
  autocmd BufReadPost,FileReadPost	  *.gz '[,']!gunzip
  autocmd BufReadPost,FileReadPost	  *.gz set nobin
  autocmd BufReadPost,FileReadPost	  *.gz execute ":doautocmd BufReadPost " . expand("%:r")
  autocmd BufWritePost,FileWritePost	*.gz !mv <afile> <afile>:r
  autocmd BufWritePost,FileWritePost	*.gz !gzip <afile>:r

  autocmd FileAppendPre		  *.gz !gunzip <afile>
  autocmd FileAppendPre		  *.gz !mv <afile>:r <afile>
  autocmd FileAppendPost		*.gz !mv <afile> <afile>:r
  autocmd FileAppendPost		*.gz !gzip <afile>:r
augroup END

" Pathogen (VIM Plugin manager)
execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in ‘runtimepath’

"
" NERDTree
"

"How can I open a NERDTree automatically when vim starts up?
" autocmd vimenter * NERDTree

"How can I open a NERDTree automatically when vim starts up if no files were specified?
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"How can I map a specific key or shortcut to open NERDTree?
"Stick this in your vimrc to open NERDTree with Ctrl+n (you can set whatever key you want):
map <C-n> :NERDTreeToggle<CR>

"How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ------------------------------------------------------------------
" Solarized Colorscheme Config
" ------------------------------------------------------------------
let g:solarized_termcolors=256    "default value is 16
let g:solarized_contrast="high"    "default value is normal
let g:solarized_visibility="high"    "default value is normal
let g:solarized_diffmode="high"    "default value is normal
let g:solarized_hitrail=1    "default value is 0
syntax enable
set background=light
colorscheme solarized

" TOHtml settings
let g:html_number_lines = 0
let g:html_dynamic_folds = 0
let g:html_no_progress = 1

" Tagbar settings
" Automatically open Tagbar for supported files
autocmd VimEnter * nested :call tagbar#autoopen(1)

" Map space to toggle fold
nnoremap <space> za
