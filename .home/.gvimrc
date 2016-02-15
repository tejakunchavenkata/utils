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
let &colorcolumn=join(range(101,999),",")
highlight ColorColumn ctermbg=2 guibg=#eeeeee

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
set background=dark
colorscheme solarized

" TOHtml settings
let g:html_number_lines = 0
let g:html_dynamic_folds = 0
let g:html_no_progress = 1

" Taglist options
"Automatically highlight the current tag in the taglist.
let Tlist_Auto_Highlight_Tag = 1
"Open the taglist window when Vim starts.
let Tlist_Auto_Open = 1
"Automatically update the taglist to include	newly edited files.
let Tlist_Auto_Update = 1
"Close the taglist window when a file or tag is selected.
let Tlist_Close_On_Select = 0
"Remove extra information and blank lines from	the taglist window.
let Tlist_Compact_Format = 0
"Specifies the path to the ctags utility. # Use default
" let Tlist_Ctags_Cmd = '>>> which ctags'
"Show prototypes and not tags in the taglist window.
" let Tlist_Display_Prototype                     = 0
"Show tag scope next to the tag name.
let Tlist_Display_Tag_Scope = 1
"Show the fold indicator column in the taglist	window.
let Tlist_Enable_Fold_Column = 0
"Close Vim if the taglist is the only window.
let Tlist_Exit_OnlyWindow = 1
"Close tag folds for inactive buffers.
let Tlist_File_Fold_Auto_Close = 1
"Jump to taglist window on open.
let Tlist_GainFocus_On_ToggleOpen = 0
"On entering a buffer, automatically highlight the current tag.
let Tlist_Highlight_Tag_On_BufEnter = 1
"Increase the Vim window width to accommodate the taglist window.
let Tlist_Inc_Winwidth = 0
"Maximum number of items in a tags sub-menu.
" let Tlist_Max_Submenu_Items = 0
"Maximum tag length used in a tag menu entry.
" let Tlist_Max_Tag_Length = 0
"Process files even when the taglist window is	closed.
" let Tlist_Process_File_Always = 0
"Display the tags menu.
let Tlist_Show_Menu = 1
"Show tags for the current buffer only.
let Tlist_Show_One_File = 0
"Sort method used for arranging the tags.
" let Tlist_Sort_Type
"Use a horizontally split window for the	taglist window.
" let Tlist_Use_Horiz_Window = 0
"Place the taglist window on the right side.
let Tlist_Use_Right_Window = 1
"Single click on a tag jumps to it.
let Tlist_Use_SingleClick = 1
"Horizontally split taglist window height.
" let Tlist_WinHeight
"Vertically split taglist window width.
" let Tlist_WinWidth
