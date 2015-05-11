" asy ftplugin file
"
" Author: LeoMao
"

setl cindent

noremap <buffer><F9> <ESC>:w!<CR>:!asy -V -noprc -render=0 -f pdf -o %:r %:r<CR><CR>
