let g:HardMode_level = 'wannabe'
let g:HardMode_hardmodeMsg = 'Rethink your life choices'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
