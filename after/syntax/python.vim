" Vim syntax file
" Language:	Python syntax extensions
" Maintainer:	LeoMao
" Last Change:	2016/6/23

syn keyword pythonConstant None True False
hi def link pythonConstant Constant

hi link pythonInclude     Statement
hi link pythonDecorator   Decorator

syn keyword pythonClass class
" syn match   pythonClass    "[a-zA-Z_][a-zA-Z0-9_]*" display contained
hi def link pythonClass Type

syn match pythonDot "\." containedin=pythonFunction
hi link pythonDot       Delimiter

" Delimiters
syn match pythonDelimiter    "[;\\]"

hi link pythonParens     pythonDelimiter
hi link pythonBrackets   pythonDelimiter
hi link pythonBraces     pythonDelimiter
hi link pythonComma      pythonDelimiter
hi link pythonColon      pythonDelimiter
hi link pythonDelimiter  Delimiter
