"
" Vundle settings
"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'tmhedberg/SimpylFold'
Plugin 'godlygeek/tabular.git'
" Not on SNPS machines
if $USER !=? 'kasula'
  Plugin 'majutsushi/tagbar'
  Plugin 'vim-scripts/taglist.vim.git'
  Plugin 'Valloric/YouCompleteMe'
endif
Plugin 'vhda/verilog_systemverilog.vim'
Plugin 'vim-perl/vim-perl.git'

" mini Excel in VIM
Plugin 'chrisbra/csv.vim.git'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-python/python-syntax'

" Following makes the saves slow
" Plugin 'vim-syntastic/syntastic'

Plugin 'cohama/lexima.vim'
" For commenting multiple lines quickly
Plugin 'scrooloose/nerdcommenter'

" For replacing with case
Plugin 'tpope/vim-abolish'

" Vimple for overlay spell suggestions
Plugin 'dahu/vimple'

" Better diff in GVIM
" Plugin 'rickhowe/diffchar.vim'

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Better matching of if-else, begin-end
" Plugin 'andymass/vim-matchup'

" To install from command line
" Probably slowing down
" vim +PluginInstall +qall

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'

" Surround with paranthesis
Plugin 'tpope/vim-surround'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

"
" General settings
"
set nu
set hlsearch
set incsearch
set autoread
set history=100
set diffopt=iwhite

" To ignore all white space
" Probably slowing down
set diffexpr=DiffW()
function DiffW()
  let opt = ""
  if &diffopt =~ "icase"
    let opt = opt . "-i "
  endif
  if &diffopt =~ "iwhite"
    let opt = opt . "-w " " swapped vim's -b with -w
  endif
  silent execute "!diff -a --binary " . opt .
        \ v:fname_in . " " . v:fname_new .  " > " . v:fname_out
endfunction

" Tab expansion settings
set et
set shiftwidth=2
set tabstop=2
set backspace=indent,eol,start
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
  if has("win32")
    set guifont=Consolas:h9
  endif
  if has("unix")
    set guifont=Powerline\ Consolas\ 9
  endif
endif

" Simplyfy VIM, by removing buttons/scrollbar
set guioptions -=T
set guioptions -=r

" Makes vim very slow
" Highlight current column and line
" set cursorline
" hi CursorLine guibg=#eeeeee
" set cursorcolumn
" hi CursorColumn guibg=#eeeeee

" Mouse always active - even in VIM mode
set mouse=a

" Setings to control too many characters in a single line
set nowrap

" Maximum line size allowed
set textwidth=100
set formatoptions+=t

" Colors the given column
highlight ColorColumn ctermbg=Grey guibg=#eeeeee
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

"How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" NERDTree and Python specific
" ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$', '\.o$', '\.swo$', '\.swp$', '^__pycache__$']

" Ignorable extentions
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.out,*/__pycache__/*


if has("gui_running")
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
endif

" TOHtml settings
let g:html_number_lines = 0
let g:html_dynamic_folds = 0
let g:html_no_progress = 1

if $USER !=? 'kasula' && has('unix')
  " Tagbar
  " let g:tagbar_width=45
  let g:tagbar_ctags_bin = "ctags"
  let g:tagbar_autofocus = 0
  let g:tagbar_show_visibility = 1
  if !&diff
    autocmd FileType * if &ft!="perl" | :call tagbar#autoopen(0) | endif
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
        \ 'e:typedefs:0:1',
        \ 'v:variables'
        \ ]
        \ }
endif

" Map space to toggle fold
nnoremap <space> za

" Bullets.vim
let g:bullets_enabled_file_types = ['markdown', 'text', 'gitcommit']
let g:bullets_enable_in_empty_buffers = 1

" Simply fold settings
let g:SimpylFold_docstring_preview=1

" Python settings
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
let python_highlight_all=1
syntax on

" More SV fle types
au! BufNewFile,BufRead *.vpp,*.svhg,*.svg setfiletype verilog_systemverilog

" CtrlP settings
let g:ctrlp_open_multiple_files = '1hj'
let g:ctrlp_open_new_file = 'h'

"
" Nerd commenter settings
"

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

"" Set a language to use its alternate delimiters by default
"let g:NERDAltDelims_java = 1

"" Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Jump to tag only on single match, else show
nnoremap <C-]> g<C-]>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Indent all file
nnoremap <F6> gg=G

" Use tags from homedir & cur dir
set tags+=~/.tags,tags

" Airline symbols
let g:airline_powerline_fonts=1
let g:Powerline_symbols='unicode'

" Make headings in restructuredtext
nnoremap <C-h> YpVr

" Make SCons files look like python
au BufReadPost SCons* set syntax=python

" Do not ask to load ycm config
let g:ycm_confirm_extra_conf=0

let g:ycm_filetype_blacklist = {
      \ 'tagbar': 1,
      \ 'qf': 1,
      \ 'notes': 1,
      \ 'markdown': 1,
      \ 'unite': 1,
      \ 'rst': 1,
      \ 'text': 1,
      \ 'vimwiki': 1,
      \ 'pandoc': 1,
      \ 'infolog': 1,
      \ 'mail': 1
      \}

" Enable spell check in RST
autocmd FileType rst setlocal spell spelllang=en
