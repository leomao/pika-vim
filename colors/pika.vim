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
  hi Normal         guibg=#1c1c1c guifg=#e4e4e4 gui=none
  hi SpecialKey     guibg=#1c1c1c guifg=#d787ff gui=none
  hi VertSplit      guibg=#1c1c1c guifg=#ffee68 gui=none
  hi SignColumn     guibg=#1c1c1c guifg=#bf81fa gui=none
  hi NonText        guibg=#1c1c1c guifg=#fc6984 gui=none
  hi Directory      guibg=#1c1c1c guifg=#ffee68 gui=none
  hi Title          guibg=#1c1c1c guifg=#d78700 gui=bold

  " -> Cursor
  hi Cursor         guibg=#e4e4e4 guifg=#1c1c1c gui=none
  hi CursorIM       guibg=#e4e4e4 guifg=#1c1c1c gui=none
  hi CursorColumn   guibg=#000000               gui=none
  hi CursorLine     guibg=#303030               gui=none
  hi CursorLineNR   guibg=#000000 guifg=#ffff00 gui=bold

  " -> Folding
  hi FoldColumn     guibg=#001336 guifg=#003dad gui=none
  hi Folded         guibg=#001336 guifg=#003dad gui=none

  " -> Line info
  hi LineNr         guibg=#000000 guifg=#696567 gui=none
  hi StatusLine     guibg=#b2b2b2 guifg=#121212 gui=none
  hi StatusLineNC   guibg=#444444 guifg=#e4e4e4 gui=none
  hi ColorColumn    guibg=#404040               gui=none

  " -> Messages
  hi ErrorMsg       guibg=#a32024 guifg=#e4e4e4 gui=none
  hi Question       guibg=#1c1c1c guifg=#ffa500 gui=none
  hi WarningMsg     guibg=#ffa500 guifg=#000000 gui=none
  hi MoreMsg        guibg=#1c1c1c guifg=#ffa500 gui=none
  hi ModeMsg        guibg=#1c1c1c guifg=#ffa500 gui=none

  " -> Search
  hi Search         guibg=#696567 guifg=#ffee68 gui=none
  hi IncSearch      guibg=#696567 guifg=#ffee68 gui=none

  " -> Diff
  hi DiffAdd        guibg=#006124 guifg=#ed9000 gui=none
  hi DiffChange     guibg=#0b294a guifg=#a36000 gui=none
  hi DiffDelete     guibg=#081f38 guifg=#ed9000 gui=none
  hi DiffText       guibg=#12457d guifg=#ed9000 gui=underline

  " -> Menu
  hi Pmenu          guibg=#303030 guifg=#bcbcbc gui=none
  hi PmenuSel       guibg=#444444 guifg=#ffdf00 gui=none
  hi PmenuSbar      guibg=#5f5fff               gui=none
  hi PmenuThumb     guibg=#0000d7               gui=none

  " -> Tabs
  hi TabLine        guibg=#141414 guifg=#1c1c1c gui=none
  hi TabLineFill    guibg=#000000               gui=none
  hi TabLineSel     guibg=#1c1c1c guifg=#e4e4e4 gui=bold
  "
  " -> Visual Mode
  hi Visual         guibg=#404040               gui=none
  hi VisualNOS      guibg=#404040               gui=none

  " -> Code
  hi Number         guibg=#1c1c1c guifg=#af00ff gui=none
  hi Constant       guibg=#1c1c1c guifg=#d75f00 gui=none
  hi Character      guibg=#1c1c1c guifg=#ffaf5f gui=none
  hi String         guibg=#1c1c1c guifg=#ffaf5f gui=none
  hi Identifier     guibg=#1c1c1c guifg=#d78700 gui=none
  hi Function       guibg=#1c1c1c guifg=#5fffd7 gui=none
  hi Special        guibg=#1c1c1c guifg=#d75f00 gui=none
  hi Type           guibg=#1c1c1c guifg=#ffd75f gui=none
  hi Decorator      guibg=#1c1c1c guifg=#af5fff gui=none
  hi Operator       guibg=#1c1c1c guifg=#d7005f gui=none
  hi Delimiter      guibg=#1c1c1c guifg=#d7005f gui=none
  hi Statement      guibg=#1c1c1c guifg=#00afff gui=none
  hi Exception      guibg=#1c1c1c guifg=#5fff00 gui=none
  hi Include        guibg=#1c1c1c guifg=#87d700 gui=none
  hi PreProc        guibg=#1c1c1c guifg=#af87ff gui=none
  hi Ignore         guibg=#1c1c1c guifg=#1c1c1c gui=none
  hi Comment        guibg=#1c1c1c guifg=#626262 gui=none
  hi Todo           guibg=#1c1c1c guifg=#ff5f5f gui=bold
  hi Error          guibg=#1c1c1c guifg=#ff5f5f gui=none
  hi MatchParen     guibg=#585858
  hi Underlined     guibg=#1c1c1c guifg=#ff5f5f gui=underline

  " -> HTML-specific
  hi htmlBold                 guibg=#1c1c1c guifg=#e4e4e4 gui=bold
  hi htmlBoldItalic           guibg=#1c1c1c guifg=#e4e4e4 gui=bold,italic
  hi htmlBoldUnderline        guibg=#1c1c1c guifg=#e4e4e4 gui=bold,underline
  hi htmlBoldUnderlineItalic  guibg=#1c1c1c guifg=#e4e4e4 gui=bold,underline,italic
  hi htmlItalic               guibg=#1c1c1c guifg=#e4e4e4 gui=italic
  hi htmlUnderline            guibg=#1c1c1c guifg=#e4e4e4 gui=underline
  hi htmlUnderlineItalic      guibg=#1c1c1c guifg=#e4e4e4 gui=underline,italic

elseif &t_Co == 256

  " -> Text; Miscellaneous
  hi Normal         ctermbg=none ctermfg=254  cterm=none
  hi SpecialKey     ctermbg=none ctermfg=177  cterm=none
  hi VertSplit      ctermbg=none ctermfg=227  cterm=none
  hi SignColumn     ctermbg=none ctermfg=141  cterm=none
  hi NonText        ctermbg=none ctermfg=204  cterm=none
  hi Directory      ctermbg=none ctermfg=227  cterm=none
  hi Title          ctermbg=none ctermfg=172  cterm=bold

  " -> Cursor
  hi Cursor         ctermbg=252  ctermfg=none cterm=none
  hi CursorIM       ctermbg=22   ctermfg=none cterm=none
  hi CursorColumn   ctermbg=0                 cterm=none
  hi CursorLine     ctermbg=none              cterm=none
  hi CursorLineNR   ctermbg=none ctermfg=226  cterm=bold

  " -> Folding
  hi FoldColumn     ctermbg=none ctermfg=25   cterm=none
  hi Folded         ctermbg=none ctermfg=25   cterm=none

  " -> Line info
  hi LineNr         ctermbg=0    ctermfg=241  cterm=none
  hi StatusLine     ctermbg=249  ctermfg=233  cterm=none
  hi StatusLineNC   ctermbg=238  ctermfg=254  cterm=none
  hi ColorColumn    ctermbg=238               cterm=none

  " -> Messages
  hi ErrorMsg       ctermbg=124  ctermfg=252  cterm=none
  hi Question       ctermbg=none ctermfg=214  cterm=none
  hi WarningMsg     ctermbg=214  ctermfg=0    cterm=none
  hi MoreMsg        ctermbg=none ctermfg=214  cterm=none
  hi ModeMsg        ctermbg=none ctermfg=214  cterm=none

  " -> Search
  hi Search         ctermbg=241  ctermfg=227  cterm=none
  hi IncSearch      ctermbg=241  ctermfg=227  cterm=none

  " -> Diff
  hi DiffAdd        ctermbg=22   ctermfg=208  cterm=none
  hi DiffChange     ctermbg=235  ctermfg=130  cterm=none
  hi DiffDelete     ctermbg=none ctermfg=208  cterm=none
  hi DiffText       ctermbg=24   ctermfg=208  cterm=underline

  " -> Menu
  hi Pmenu          ctermbg=236  ctermfg=250  cterm=none
  hi PmenuSel       ctermbg=238  ctermfg=220  cterm=none
  hi PmenuSbar      ctermbg=63                cterm=none
  hi PmenuThumb     ctermbg=20                cterm=none

  " -> Tabs
  hi TabLine        ctermbg=233  ctermfg=none cterm=none
  hi TabLineFill    ctermbg=0                 cterm=none
  hi TabLineSel     ctermbg=none ctermfg=252  cterm=bold
  "
  " -> Visual Mode
  hi Visual         ctermbg=238               cterm=none
  hi VisualNOS      ctermbg=238               cterm=none

  " -> Code
  hi Number         ctermbg=none ctermfg=129  cterm=none
  hi Constant       ctermbg=none ctermfg=166  cterm=none
  hi Character      ctermbg=none ctermfg=215  cterm=none
  hi String         ctermbg=none ctermfg=215  cterm=none
  hi Identifier     ctermbg=none ctermfg=172  cterm=none
  hi Function       ctermbg=none ctermfg=86   cterm=none
  hi Special        ctermbg=none ctermfg=166  cterm=none
  hi Type           ctermbg=none ctermfg=221  cterm=none
  hi Decorator      ctermbg=none ctermfg=135  cterm=none
  hi Operator       ctermbg=none ctermfg=161  cterm=none
  hi Delimiter      ctermbg=none ctermfg=161  cterm=none
  hi Statement      ctermbg=none ctermfg=39   cterm=none
  hi Exception      ctermbg=none ctermfg=82   cterm=none
  hi Include        ctermbg=none ctermfg=112  cterm=none
  hi PreProc        ctermbg=none ctermfg=141  cterm=none
  hi Ignore         ctermbg=none ctermfg=none cterm=none
  hi Comment        ctermbg=none ctermfg=241  cterm=none
  hi Todo           ctermbg=none ctermfg=203  cterm=bold
  hi Error          ctermbg=none ctermfg=203  cterm=none
  hi MatchParen     ctermbg=240
  hi Underlined     ctermbg=none ctermfg=203  cterm=underline

  " -> HTML-specific
  hi htmlBold                 ctermbg=none ctermfg=254 cterm=bold
  hi htmlBoldItalic           ctermbg=none ctermfg=254 cterm=bold,italic
  hi htmlBoldUnderline        ctermbg=none ctermfg=254 cterm=bold,underline
  hi htmlBoldUnderlineItalic  ctermbg=none ctermfg=254 cterm=bold,underline,italic
  hi htmlItalic               ctermbg=none ctermfg=254 cterm=italic
  hi htmlUnderline            ctermbg=none ctermfg=254 cterm=underline
  hi htmlUnderlineItalic      ctermbg=none ctermfg=254 cterm=underline,italic

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
