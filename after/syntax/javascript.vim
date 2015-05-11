" Vim syntax file
" Language:	JS syntax extensions
" Maintainer:	LeoMao
" Last Change:	2013/7/4
"

" syntax sync minlines=200

" Functions
syn match javascriptFuncDot "[.]" contained
syn match jsFunction "\(\.\)\<\h\w*\>\(\s\|\n\)*("me=e-1 contains=javascriptFuncDot

hi def link javascriptFuncDot  Operator
hi def link jsFunction Function

syn keyword jsjQueryConstant $
syn keyword jsjQueryConstant jQuery

hi def link jsjQueryConstant   Special

" override plugin's settings
hi link jsArrowFunction        Function
hi link jsFunction             Function
hi link jsFuncName             Normal
hi link jsClass                Type
hi link jsNull                 Special
hi link jsUndefined            Special
hi link jsNoise                Delimiter
hi link jsBrackets             Delimiter
hi link jsParens               Delimiter
hi link jsBraces               Delimiter
hi link jsFuncBraces           Delimiter
hi link jsFuncParens           Delimiter
hi link jsGlobalObjects        Type
hi link jsFuncArgCommas        Delimiter
hi link jsTernaryIfOperator    Operator
