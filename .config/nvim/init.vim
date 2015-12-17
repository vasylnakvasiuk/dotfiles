if filereadable(expand('~/.config/nvim/plugins.vim'))
  " Include plugins list
  source ~/.config/nvim/plugins.vim
endif

set number " Enable line numbers

" | Color options | {{{
set background=dark
let base16colorspace=256
colorscheme base16-eighties
" | Color options | }}}