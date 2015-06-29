" Vim syntax file
" Language:	C/C++ syntax extensions
" Maintainer:	LeoMao
" Last Change:	2014/6/30
"

" Highlight Class and Function names
"syn match    cCustomParen    "(" contains=cParen,cCppParen
"syn match    cCustomFunc     "\w\+\s*("me=e-1 contains=cType
"syn match    cCustomScope    "::"

"hi def link cCustomFunc  Function
"hi def link cCustomFunc  Function
"hi def link cCustomScope Operator

" Operators
syn match cOperator	"\(<<\|>>\|[-+*/%&^|<>!=]\)="
syn match cOperator	"<<\|>>\|&&\|||\|++\|--\|->"
syn match cOperator	"[.!?:~*&%<>^|=,+-]"
syn match cOperator	"/[^/*=]"me=e-1
syn match cOperator	"/$"
syn match cOperator "&&\|||"

" highlight : in label or scope identifier
hi link cUserCont Operator

" highlight operator, typeid as statement
syn keyword ccOperator operator typeid
hi link ccOperator Statement

" Functions
syn match cUserFunction "\(\.\|->\)\<\h\w*\>\(\s\|\n\)*("me=e-1 contains=cType,cDelimiter,cDefine,cOperator
syn match cUserFunctionPointer "(\s*\*\s*\h\w*\s*)\(\s\|\n\)*(" contains=cDelimiter,cOperator

hi def link cUserFunction cFunction
hi def link cUserFunctionPointer cFunction

" Preprocs
syn keyword cDefined defined contained containedin=cDefine
hi def link cDefined cDefine

" Delimiters
syn match cDelimiter    "[;\\]"
syn match cBraces display "[][{}()]"

" Booleans
syn keyword cBoolean true false TRUE FALSE

" Links
hi def link cFunction Function
hi def link cIdentifier Identifier
hi def link cDelimiter Delimiter
hi def link cBraces Delimiter
hi def link cBoolean Boolean

hi link cIncluded Include

" foldmethod=syntax fix, courtesy of Ivan Freitas
