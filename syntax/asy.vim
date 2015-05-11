" Vim syntax file
" Language: Asymptote
" Last Change: 2012-03-07
" Author: Leo Mao

if exists("b:current_syntax")
  finish
endif

syn match	asyNumbers	display transparent "\<\d\|\.\d" contains=asyNumber,asyFloat,asyOctal
" Same, but without octal error (for comments)
syn match	asyNumbersCom	display contained transparent "\<\d\|\.\d" contains=asyNumber,asyFloat,asyOctal
syn match	asyNumber		display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"
"hex number
syn match	asyNumber		display contained "0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"
" Flag the first zero of an octal number as something special
syn match	asyOctal		display contained "0\o\+\(u\=l\{0,2}\|ll\=u\)\>" contains=asyOctalZero
syn match	asyOctalZero	display contained "\<0"
syn match	asyFloat		display contained "\d\+f"
"floating point number, with dot, optional exponent
syn match	asyFloat		display contained "\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
"floating point number, starting with a dot, optional exponent


syn keyword asyType	pair int real path string triple bool new void pen picture Label align marker margin circle line point
syn keyword asyStatement    draw write dot size struct operator return if else for while drawline label
syn keyword asyFunction	    intersects intersect extension abs dir rotate intersectionpoint intersectionpoints
syn keyword asyConstant	    true false cycle this
syn region asyString start=+L\="+ skip=+\\\\\|\\"+ end=+"+
syn region asyImport start="import\|include" end="$"
syn match asyOperator display '[{}()\[\]]\|[-&|+<>=*/^%!?~;,.]'
syn region asyCommentL start="//" skip="\\$" end="$"
syn region asyComment start="/\*" end="\*/"

hi def link asyConstant	    Constant
hi def link asyString	    String
hi def link asyFloat	    asyNumber
hi def link asyImport	    Include
hi def link asyType	    Type
hi def link asyStatement    Statement
hi def link asyFunction	    Function
hi def link asyNumber	    Number
hi def link asyCommentL	    asyComment
hi def link asyOperator	    Operator
hi def link asyComment	    Comment

let b:current_syntax = "asy"
