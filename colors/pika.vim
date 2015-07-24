" Vim color file
" Name:       pika.vim
" Author:     Leo Mao

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "pika"

set background=dark

" Set some syntax-related variables
let ruby_operators = 1

if has("gui_running")

  " -> Text; Miscellaneous
  hi Normal         guibg=#1F1F1F guifg=#D0D0D0 gui=none
  hi SpecialKey     guibg=#1F1F1F guifg=#E88CFF gui=none
  hi VertSplit      guibg=#1F1F1F guifg=#FFEE68 gui=none
  hi SignColumn     guibg=#1F1F1F guifg=#BF81FA gui=none
  hi NonText        guibg=#1F1F1F guifg=#FC6984 gui=none
  hi Directory      guibg=#1F1F1F guifg=#FFEE68 gui=none 
  hi Title          guibg=#1F1F1F guifg=#D78700 gui=bold

  " -> Cursor 
  hi Cursor         guibg=#D0D0D0 guifg=#1F1F1F gui=none
  hi CursorIM       guibg=#D0D0D0 guifg=#1F1F1F gui=none
  hi CursorColumn   guibg=#000000               gui=none
  hi CursorLine     guibg=#303030               gui=none

  " -> Folding
  hi FoldColumn     guibg=#001336 guifg=#003DAD gui=none
  hi Folded         guibg=#001336 guifg=#003DAD gui=none

  " -> Line info  
  hi LineNr         guibg=#000000 guifg=#696567 gui=none
  hi StatusLine     guibg=#b2b2b2 guifg=#121212 gui=none
  hi StatusLineNC   guibg=#444444 guifg=#e4e4e4 gui=none
  hi ColorColumn    guibg=#404040               gui=none

  " -> Messages
  hi ErrorMsg       guibg=#A32024 guifg=#D0D0D0 gui=none
  hi Question       guibg=#1F1F1F guifg=#FFA500 gui=none
  hi WarningMsg     guibg=#FFA500 guifg=#000000 gui=none
  hi MoreMsg        guibg=#1F1F1F guifg=#FFA500 gui=none
  hi ModeMsg        guibg=#1F1F1F guifg=#FFA500 gui=none

  " -> Search 
  hi Search         guibg=#696567 guifg=#FFEE68 gui=none 
  hi IncSearch      guibg=#696567 guifg=#FFEE68 gui=none

  " -> Diff
  hi DiffAdd        guibg=#006124 guifg=#ED9000 gui=none
  hi DiffChange     guibg=#0B294A guifg=#A36000 gui=none
  hi DiffDelete     guibg=#081F38 guifg=#ED9000 gui=none
  hi DiffText       guibg=#12457D guifg=#ED9000 gui=underline

  " -> Menu
  hi Pmenu          guibg=#140100 guifg=#660300 gui=none
  hi PmenuSel       guibg=#F17A00 guifg=#4C0200 gui=none
  hi PmenuSbar      guibg=#430300               gui=none
  hi PmenuThumb     guibg=#720300               gui=none
  hi PmenuSel       guibg=#F17A00 guifg=#4C0200 gui=none

  " -> Tabs
  hi TabLine        guibg=#141414 guifg=#1F1F1F gui=none
  hi TabLineFill    guibg=#000000               gui=none
  hi TabLineSel     guibg=#1F1F1F guifg=#D0D0D0 gui=bold  
  "
  " -> Visual Mode
  hi Visual         guibg=#404040	    	      gui=none
  hi VisualNOS      guibg=#404040		          gui=none

  " -> Code
  hi Include        guibg=#1F1F1F guifg=#00AF00 gui=none
  hi Number	      guibg=#1F1F1F guifg=#AF00FF gui=none
  hi Comment        guibg=#1F1F1F guifg=#696567 gui=none
  hi Constant       guibg=#1F1F1F guifg=#D75F00 gui=none
  hi Character      guibg=#1F1F1F guifg=#FFB539 gui=none
  hi String         guibg=#1F1F1F guifg=#FFB539 gui=none
  hi Error          guibg=#1F1F1F guifg=#FC4234 gui=none
  hi Identifier     guibg=#1F1F1F guifg=#D78700 gui=none
  hi Function       guibg=#1F1F1F guifg=#61D7FF gui=none
  hi Ignore         guibg=#1F1F1F guifg=#1F1F1F gui=none
  hi MatchParen     guibg=#585858
  hi PreProc	      guibg=#1F1F1F guifg=#AF5FFF gui=none
  hi Decorator      guibg=#1F1F1F guifg=#AF5FFF gui=none
  hi Special        guibg=#1F1F1F guifg=#D75F00 gui=none
  hi Todo           guibg=#1F1F1F guifg=#FC4234 gui=bold
  hi Underlined     guibg=#1F1F1F guifg=#FC4234 gui=underline
  hi Statement      guibg=#1F1F1F guifg=#0E90FF gui=none
  hi Operator       guibg=#1F1F1F guifg=#D70000 gui=none
  hi Delimiter      guibg=#1F1F1F guifg=#D70000 gui=none
  hi Type           guibg=#1F1F1F guifg=#FFDF5F gui=none
  hi Exception      guibg=#1F1F1F guifg=#5FD700 gui=none

  " -> HTML-specific
  hi htmlBold                 guibg=#1F1F1F guifg=#D0D0D0 gui=bold
  hi htmlBoldItalic           guibg=#1F1F1F guifg=#D0D0D0 gui=bold,italic
  hi htmlBoldUnderline        guibg=#1F1F1F guifg=#D0D0D0 gui=bold,underline
  hi htmlBoldUnderlineItalic  guibg=#1F1F1F guifg=#D0D0D0 gui=bold,underline,italic
  hi htmlItalic               guibg=#1F1F1F guifg=#D0D0D0 gui=italic
  hi htmlUnderline            guibg=#1F1F1F guifg=#D0D0D0 gui=underline
  hi htmlUnderlineItalic      guibg=#1F1F1F guifg=#D0D0D0 gui=underline,italic

elseif &t_Co == 256

  " -> Text; Miscellaneous
  hi Normal         ctermbg=none ctermfg=252 cterm=none
  hi SpecialKey     ctermbg=none ctermfg=177 cterm=none
  hi VertSplit      ctermbg=none ctermfg=227 cterm=none
  hi SignColumn     ctermbg=none ctermfg=141 cterm=none
  hi NonText        ctermbg=none ctermfg=204 cterm=none
  hi Directory      ctermbg=none ctermfg=227 cterm=none 
  hi Title          ctermbg=none ctermfg=172 cterm=bold

  " -> Cursor 
  hi Cursor         ctermbg=252 ctermfg=none cterm=none
  hi CursorIM       ctermbg=22  ctermfg=none cterm=none
  hi CursorColumn   ctermbg=0                cterm=none
  hi CursorLine     ctermbg=none             cterm=none

  " -> Folding
  hi FoldColumn     ctermbg=none ctermfg=25  cterm=none
  hi Folded         ctermbg=none ctermfg=25  cterm=none

  " -> Line info  
  hi LineNr         ctermbg=0    ctermfg=241 cterm=none
  hi StatusLine     ctermbg=249  ctermfg=233 cterm=none
  hi StatusLineNC   ctermbg=238  ctermfg=254 cterm=none
  hi ColorColumn    ctermbg=238              cterm=none

  " -> Messages
  hi ErrorMsg       ctermbg=124  ctermfg=252 cterm=none
  hi Question       ctermbg=none ctermfg=214 cterm=none
  hi WarningMsg     ctermbg=214  ctermfg=0   cterm=none
  hi MoreMsg        ctermbg=none ctermfg=214 cterm=none
  hi ModeMsg        ctermbg=none ctermfg=214 cterm=none

  " -> Search 
  hi Search         ctermbg=241  ctermfg=227 cterm=none 
  hi IncSearch      ctermbg=241  ctermfg=227 cterm=none

  " -> Diff
  hi DiffAdd        ctermbg=22   ctermfg=208 cterm=none
  hi DiffChange     ctermbg=235  ctermfg=130 cterm=none
  hi DiffDelete     ctermbg=none ctermfg=208 cterm=none
  hi DiffText       ctermbg=24   ctermfg=208 cterm=underline

  " -> Menu
  hi Pmenu          ctermbg=0    ctermfg=52  cterm=none
  hi PmenuSel       ctermbg=208  ctermfg=52  cterm=none
  hi PmenuSbar      ctermbg=52               cterm=none
  hi PmenuThumb     ctermbg=52               cterm=none
  hi PmenuSel       ctermbg=208  ctermfg=52  cterm=none

  " -> Tabs
  hi TabLine        ctermbg=233  ctermfg=none cterm=none
  hi TabLineFill    ctermbg=0                 cterm=none
  hi TabLineSel     ctermbg=none ctermfg=252  cterm=bold  
  "
  " -> Visual Mode
  hi Visual         ctermbg=238    	       cterm=none
  hi VisualNOS      ctermbg=238              cterm=none

  " -> Code
  hi Include        ctermbg=none ctermfg=34  cterm=none
  hi Number	      ctermbg=none ctermfg=129 cterm=none
  hi Comment        ctermbg=none ctermfg=241 cterm=none
  hi Constant       ctermbg=none ctermfg=166 cterm=none
  hi Character      ctermbg=none ctermfg=215 cterm=none
  hi String         ctermbg=none ctermfg=215 cterm=none
  hi Error          ctermbg=none ctermfg=203 cterm=none
  hi Identifier     ctermbg=none ctermfg=172 cterm=none
  hi Function       ctermbg=none ctermfg=81  cterm=none
  hi Ignore         ctermbg=none ctermfg=none cterm=none
  hi MatchParen     ctermbg=240
  hi PreProc	      ctermbg=none ctermfg=135  cterm=none
  hi Decorator      ctermbg=none ctermfg=135 cterm=none
  hi Special        ctermbg=none ctermfg=166 cterm=none
  hi Todo           ctermbg=none ctermfg=203 cterm=bold
  hi Underlined     ctermbg=none ctermfg=203 cterm=underline
  hi Statement      ctermbg=none ctermfg=33  cterm=none
  hi Operator       ctermbg=none ctermfg=160 cterm=none
  hi Delimiter      ctermbg=none ctermfg=160 cterm=none
  hi Type           ctermbg=none ctermfg=221 cterm=none
  hi Exception      ctermbg=none ctermfg=76  cterm=none

  " -> HTML-specific
  hi htmlBold                 ctermbg=none ctermfg=252 cterm=bold
  hi htmlBoldItalic           ctermbg=none ctermfg=252 cterm=bold,italic
  hi htmlBoldUnderline        ctermbg=none ctermfg=252 cterm=bold,underline
  hi htmlBoldUnderlineItalic  ctermbg=none ctermfg=252 cterm=bold,underline,italic
  hi htmlItalic               ctermbg=none ctermfg=252 cterm=italic
  hi htmlUnderline            ctermbg=none ctermfg=252 cterm=underline
  hi htmlUnderlineItalic      ctermbg=none ctermfg=252 cterm=underline,italic

endif

hi! default link bbcodeBold htmlBold
hi! default link bbcodeBoldItalic htmlBoldItalic
hi! default link bbcodeBoldItalicUnderline htmlBoldUnderlineItalic
hi! default link bbcodeBoldUnderline htmlBoldUnderline
hi! default link bbcodeItalic htmlItalic
hi! default link bbcodeItalicUnderline htmlUnderlineItalic
hi! default link bbcodeUnderline htmlUnderline


" hi def link
"hi link Include Preproc
hi link Define Include

" Spellcheck formatting
if has("spell")
  hi SpellBad   guisp=#FC4234 gui=undercurl
  hi SpellCap   guisp=#70BDF1 gui=undercurl
  hi SpellLocal guisp=#FFEE68 gui=undercurl
  hi SpellRare  guisp=#6DF584 gui=undercurl
endif
