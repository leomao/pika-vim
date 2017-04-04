" markdown
"
" Author: LeoMao
"

" prevent syntax conflict in math mode
syn region MathBlock start=/\$\$/ end=/\$\$/
syn region MathBlock start=/\\\[/ end=/\\\]/
syn match  InlineMath '\$[^$].\{-}\$'
syn match  InlineMath '\\([^$].\{-}\\)'
