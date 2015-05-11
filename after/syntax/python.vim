" Vim syntax file
" Language:	Python syntax extensions
" Maintainer:	LeoMao
" Last Change:	2014/8/18
"

syn keyword pythonConstant None self
hi def link pythonConstant Constant
hi def link Boolean Constant

hi link pythonImport Statement

syn keyword pythonClass class
" syn match   pythonClass    "[a-zA-Z_][a-zA-Z0-9_]*" display contained
hi def link pythonClass Type

hi link pythonDecorator   Decorator
hi link pythonRun         Comment
hi link pythonDottedName  Function
hi link pythonDot         Operator

" Operators
syn match pyOperator	"\(<<\|>>\|[-+*/%&^|<>!=]\)="
syn match pyOperator	"<<\|>>"
syn match pyOperator	"[.!?:~*&%<>^|=,+-/]"
syn match pyOperator    "&&\|||"

" Delimiters
syn match pyDelimiter    "[;\\]"
syn match pyBraces display "[][(){}]"

hi def link pyOperator Operator
hi def link pyDelimiter Delimiter
hi def link pyBraces Delimiter
" foldmethod=syntax fix, courtesy of Ivan Freitas

