"
" General settings
"
set nu
set hlsearch
set incsearch
set autoread
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

" Navigate splits with Shift Arrows
nmap <silent> <S-Up> <C-W>k
nmap <silent> <S-Down> <C-W>j
nmap <silent> <S-Right> <C-W>l
nmap <silent> <S-Left> <C-W>h

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

" Tagbar
" let g:tagbar_width=45
let g:tagbar_ctags_bin = "ctags-exuberant"
let g:tagbar_autofocus = 0
let g:tagbar_show_visibility = 1
if !&diff
  autocmd FileType * nested :call tagbar#autoopen(0)
endif

" Makefile tagbar settings
let g:tagbar_type_make = {
    \ 'kinds':[
        \ 'm:macros',
        \ 't:targets'
    \ ]
\}

" SV tagbar
let g:tagbar_type_systemverilog = {
        \ 'ctagstype'   : 'SystemVerilog',
        \ 'kinds'       : [
            \ 'b:blocks:1:1',
            \ 'c:constants:1:0',
            \ 'i:constraints:1:0',
            \ 'e:events:1:0',
            \ 'f:functions:1:1',
            \ 'm:modules:0:1',
            \ 'n:nets:1:0',
            \ 'p:ports:1:0',
            \ 'r:registers:1:0',
            \ 't:tasks:1:1',
            \ 'A:assertions:1:1',
            \ 'C:classes:0:1',
            \ 'V:covergroups:0:1',
            \ 'I:interfaces:0:1',
            \ 'M:modport:0:1',
            \ 'K:packages:0:1',
            \ 'P:programs:0:1',
            \ 'R:properties:0:1',
            \ 'T:typedefs:0:1',
            \ 'v:variables'
        \ ]
    \ }


" Map space to toggle fold
nnoremap <space> za

" Bullets.vim
let g:bullets_enabled_file_types = ['markdown', 'text', 'gitcommit']
let g:bullets_enable_in_empty_buffers = 1
