" Vim syntax file
" Language:	Python syntax extensions
" Maintainer:	LeoMao
" Last Change:	2016/4/9
"

syn keyword pythonConstant None True False self
hi def link pythonConstant Constant

hi link pythonInclude Statement
hi link pythonDecorator   Decorator

syn keyword pythonClass class
" syn match   pythonClass    "[a-zA-Z_][a-zA-Z0-9_]*" display contained
hi def link pythonClass Type

syn match pythonDot "\." containedin=pythonFunction
hi link pythonDot       Delimiter

" Operators
syn match pyOperator  "\(<<\|>>\|[+\-*/&%\^|<>~!=]\)="
syn match pyOperator  "<<\|>>"
syn match pyOperator  "[+\-*/&%\^|<>~!=]"
syn match pyOperator  "&&\|||"

hi link pyOperator Operator

" Delimiters
syn match pyDelimiter    "[:,;\\]"
syn match pyParens display "[()]"
syn match pyBraces display "[{}]"
syn match pyBrackets display "[][]"

hi link pyParens     pyDelimiter
hi link pyBraces     pyDelimiter
hi link pyBrackets   pyDelimiter
hi link pyDelimiter  Delimiter
