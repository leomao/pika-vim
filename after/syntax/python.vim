" Vim syntax file
" Language:	Python syntax extensions
" Maintainer:	LeoMao
" Last Change:	2016/4/9
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

hi link pyOperator Operator

" Delimiters
syn match pyDelimiter    "[;\\]"
syn match pyParens display "[()]"
syn match pyBraces display "[{}]"
syn match pyBrackets display "[][]"

hi link pyParens     pyDelimiter
hi link pyBraces     pyDelimiter
hi link pyBrackets   pyDelimiter
hi link pyDelimiter  Delimiter
