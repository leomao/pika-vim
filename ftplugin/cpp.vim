" cpp ftplugin file
"
" Author: LeoMao
"

setl cindent

if !exists('g:cpp_astyle_mapping')
  let g:cpp_astyle_mapping = '<F3>'
endif

if !exists('g:cpp_astyle_options')
  let g:cpp_astyle_options = '-A8KpHUyk1qs2 -xG'
endif

if !exists('g:cpp_ctags_mapping')
  let g:cpp_ctags_mapping = '<F12>'
endif

if !exists('g:cpp_ctags_options')
  let g:cpp_ctags_options = '-R --c++-kinds=+pl --fields=+iaS --extra=+q'
endif

if !exists('g:cpp_compile_options')
  let g:cpp_compile_options = '-O2 -std=c++11 -Wall -Wshadow'
endif

"styling mappings (need astyle)
execute 'noremap <buffer>' . g:cpp_astyle_mapping .
      \ ' <ESC>:%!astyle ' . g:cpp_astyle_options . '<CR>'

" tag generation mappings (need ctags)
execute 'noremap <buffer>' . g:cpp_ctags_mapping .
      \ ' <ESC>:!ctags ' . g:cpp_ctags_options . '%:p:h <CR><CR>'

" compile mappings (need g++)
noremap <buffer><C-F9> <ESC>:call SingleCompile()<CR>:echo "Single Compile On"<CR>

" for compile single cpp file
function! SingleCompile()
  let &l:makeprg='g++ ' . g:cpp_compile_options . ' -o %:r %'
endfunction

