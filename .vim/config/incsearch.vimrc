set hlsearch
let g:incsearch#auto_nohlsearch = 1
" Search forwards
map \ <Plug>(incsearch-forward)
" Search backwards
map ? <Plug>(incsearch-backward)
" Search for the current word you're on
" And search forwards
map * <Plug>(incsearch-nohl-*) 
" Search for the current word you're on
" And search backwards
map # <Plug>(incsearch-nohl-#)
" Search for words containing the word you're on
" And search forwards
map g* <Plug>(incsearch-nohl-g*)
" Search for words containing the word you're on
" And search backwards
map g# <Plug>(incsearch-nohl-g#)
