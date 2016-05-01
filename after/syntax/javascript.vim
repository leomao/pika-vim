" Vim syntax file
" Language:	JS syntax customization for vim-javscript syntax
" Maintainer:	LeoMao

" syntax sync minlines=200

" override plugin's settings

hi link jsFuncParens       jsParens
hi link jsFuncBraces       jsBraces

hi link jsNoise            Delimiter
hi link jsParens           Delimiter
hi link jsBraces           Delimiter
hi link jsBrackets         Delimiter
hi link jsNull             Constant

hi link jsArrowFunction    Function
