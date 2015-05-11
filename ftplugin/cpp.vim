" cpp ftplugin file
"
" Author: LeoMao
"

setl cindent

"styling mappings (need astyle)
noremap <buffer><F3> <ESC>:%!astyle -A8KpHUyk1qs2<CR>

" tag generation mappings (need ctags)
noremap <buffer><F12> <ESC>:wa!<CR>:!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q %:p:h <CR><CR>

" compile mappings (need g++)
noremap <buffer><C-F9> <ESC>:call SingleCompile()<CR>:echo "Single Compile On"<CR>

" for compile single cpp file
function! SingleCompile()
  setl makeprg=g++\ -O2\ -std=c++11\ -Wall\ -Wshadow\ -o\ %:r\ %
endfunction

