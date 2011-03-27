" Set up GUI options.
if has("mac")
  set guifont=Mensch:h12
elseif has("gui_gtk2")
  set guifont=Mensch\ 10
endif

"if has("linux")
"
"endif

set guioptions-=T

" Save on losing focus
" au FocusLost * :wa

" Set colors again for vim's benefit (?)
colorscheme vilight2

