" python ftplugin file
"
" Author: LeoMao
"

setl et ts=4 sw=4 sts=4

noremap <buffer><F12> <ESC>:wa!<CR>:!ctags -R --python-kinds=-i %:p:h <CR><CR>
noremap <buffer><C-F9> <ESC>:wa!<CR>:!chmod a+x %<CR><CR>
