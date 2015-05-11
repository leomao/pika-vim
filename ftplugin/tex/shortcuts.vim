" LaTeX plugin for Vim
"
" Edited by: Leo Mao (leomao@users.sourcefoge.net)
" add some greek shortcut

if exists('g:maplocalleader')
  let s:localleader_saved = g:maplocalleader
  let g:maplocalleader = ';'
endif

inoremap <buffer> <LocalLeader><LocalLeader> <LocalLeader>

" Greek
inoremap <silent><buffer> <LocalLeader>a \alpha
inoremap <silent><buffer> <LocalLeader>b \beta
inoremap <silent><buffer> <LocalLeader>c \chi
inoremap <silent><buffer> <LocalLeader>d \delta
inoremap <silent><buffer> <LocalLeader>e \epsilon
inoremap <silent><buffer> <LocalLeader>f \phi
inoremap <silent><buffer> <LocalLeader>g \gamma
inoremap <silent><buffer> <LocalLeader>h \eta
inoremap <silent><buffer> <LocalLeader>k \kappa
inoremap <silent><buffer> <LocalLeader>l \lambda
inoremap <silent><buffer> <LocalLeader>m \mu
inoremap <silent><buffer> <LocalLeader>n \nu
inoremap <silent><buffer> <LocalLeader>o \omega
inoremap <silent><buffer> <LocalLeader>p \pi
inoremap <silent><buffer> <LocalLeader>q \theta
inoremap <silent><buffer> <LocalLeader>r \rho
inoremap <silent><buffer> <LocalLeader>s \sigma
inoremap <silent><buffer> <LocalLeader>t \tau
inoremap <silent><buffer> <LocalLeader>u \upsilon
inoremap <silent><buffer> <LocalLeader>w \varpi
inoremap <silent><buffer> <LocalLeader>x \xi
inoremap <silent><buffer> <LocalLeader>y \psi
inoremap <silent><buffer> <LocalLeader>z \zeta
inoremap <silent><buffer> <LocalLeader>D \Delta
inoremap <silent><buffer> <LocalLeader>F \Phi
inoremap <silent><buffer> <LocalLeader>G \Gamma
inoremap <silent><buffer> <LocalLeader>L \Lambda
inoremap <silent><buffer> <LocalLeader>O \Omega
inoremap <silent><buffer> <LocalLeader>P \Pi
inoremap <silent><buffer> <LocalLeader>Q \Theta
inoremap <silent><buffer> <LocalLeader>U \Upsilon
inoremap <silent><buffer> <LocalLeader>X \Xi
inoremap <silent><buffer> <LocalLeader>Y \Psi

" Math
inoremap <silent><buffer> <LocalLeader>½ \sqrt{}<Left>
inoremap <silent><buffer> <LocalLeader>N \nabla
inoremap <silent><buffer> <LocalLeader>S \sum_{}^{}<Esc>F}i
inoremap <silent><buffer> <LocalLeader>I \int\limits_{}^{}<Esc>F}i
inoremap <silent><buffer> <LocalLeader>0 \emptyset
inoremap <silent><buffer> <LocalLeader>6 \partial
inoremap <silent><buffer> <LocalLeader>i \infty
inoremap <silent><buffer> <LocalLeader>/ \frac{}{}<Esc>F}i
inoremap <silent><buffer> <LocalLeader>v \vee
inoremap <silent><buffer> <LocalLeader>& \wedge
inoremap <silent><buffer> <LocalLeader>@ \circ
inoremap <silent><buffer> <LocalLeader>\ \setminus
inoremap <silent><buffer> <LocalLeader>= \equiv
inoremap <silent><buffer> <LocalLeader>- \bigcap
inoremap <silent><buffer> <LocalLeader>+ \bigcup
inoremap <silent><buffer> <LocalLeader>< \leq
inoremap <silent><buffer> <LocalLeader>> \geq
inoremap <silent><buffer> <LocalLeader>~ \tilde{}<Left>
inoremap <silent><buffer> <LocalLeader>^ \hat{}<Left>
inoremap <silent><buffer> <LocalLeader>_ \bar{}<Left>
inoremap <silent><buffer> <LocalLeader>. \dot{}<Left>
inoremap <silent><buffer> <LocalLeader><CR> \nonumber\\<CR>

" Enlarged delimiters
inoremap <silent><buffer> <LocalLeader>( \left(\right)<Esc>F(a
inoremap <silent><buffer> <LocalLeader>[ \left[\right]<Esc>F[a
inoremap <silent><buffer> <LocalLeader>{ \left\{ \right\}<Esc>F a

" Neat insertion of various LaTeX constructs by tapping keys
inoremap <silent><buffer><expr> _ IsLeft('_') ? '{}<Left>' : '_'
inoremap <silent><buffer><expr> ^ IsLeft('^') ? '{}<Left>' : '^'
inoremap <silent><buffer><expr> = IsLeft('=') ? '<BS>&=' : '='
inoremap <silent><buffer><expr> ~ IsLeft('~') ? '<BS>\approx' : '~'
inoremap <silent><buffer><expr> < IsLeft('<') ? '<BS>\ll' : '<'
inoremap <silent><buffer><expr> > IsLeft('>') ? '<BS>\gg' : '>'

function! IsLeft(lchar)
  let left = getline('.')[col('.')-2]
  return left == a:lchar ? 1 : 0
endfunction

if exists('s:localleader_saved')
  let g:maplocalleader = s:localleader_saved
else
  unlet g:maplocalleader
endif

" vim: fdm=marker sw=2
