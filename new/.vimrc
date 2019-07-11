

"Training

let g:HardMode_level = 'wannabe'
let g:HardMode_hardmodeMsg = 'Don''t use this!'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
"Globals

" attempt to determine the file type based on its name and contents
" Allows intelligent autoindentation
filetype plugin indent on
" Enable syntax highlighting
syntax on

" colorschemes
colorscheme focuspoint2

"Set leader to ,
let mapleader=","

"command line completion
set wildmenu

" shows partial commands in the last line of the screen
set showcmd

"Highlights searches

"Ignore case in searches unless using capital letters
set ignorecase
set smartcase

"auto indent that bitch for sexy indents
set autoindent
set cindent

"Stop from going to the start of a line on certain movements
set nostartofline

"Instead of an error on quit without saving, gives you a highlight box to
"confirm
set confirm
if has("autocmd")
	au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
	au InsertEnter,InsertChange *
	\ if v:insertmode == 'i' | 
	\   silent execute '!echo -ne "\e[6 q"' | redraw! |
	\ elseif v:insertmode == 'r' |
	\   silent execute '!echo -ne "\e[4 q"' | redraw! |
	\ endif
	au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif


set hlsearch
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map / <Plug>(incsearch-forward)
map / <Plug>(incsearch-forward)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
"visual bell instead of audio if you do something wrong
set visualbell

"enable mouse for all modes
set mouse=a

"line numbers on the left
set number

hi comment guifg=#ffffff


"indentation macros
set shiftwidth=4
set softtabstop=4
set expandtab

"Colors
set t_Co=256
set background=dark
set laststatus=2

"Plugins
execute pathogen#infect()

"Indentation guides
let g:indent_guides_enable_on_vim_startup = 0

"nerd tree - toggle with ctrl n
map <C-n> :NERDTreeToggle<CR>


"git gutter
"let g:gitgutter_enabled = 1
"let g:gitgutter_signs = 1


"Nerd commenter
"set 1 line after a comment delimiter
let g:NERDSpaceDelims = 1

"compact for multiple lines
let g:NERDCompactSexyComs = 1


" Align line-wise comment delimiters flush left instead of following code indentation
 let g:NERDDefaultAlign = 'left'

 " Set a language to use its alternate delimiters by default
 let g:NERDAltDelims_java = 1

 " Add your own custom formats or override the defaults
 let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

 " Allow commenting and inverting empty lines (useful when commenting a region)
 let g:NERDCommentEmptyLines = 1

 " Enable trimming of trailing whitespace when uncommenting
 let g:NERDTrimTrailingWhitespace = 1

 " Enable NERDCommenterToggle to check all selected lines is commented or not 
 let g:NERDToggleCheckAllLines = 1

"C++ highlighter
let g:cpp_class_scope_highlight = 1

let g:cpp_member_variable_highlight = 1

