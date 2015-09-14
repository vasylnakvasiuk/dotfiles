call plug#begin('~/.nvim/plugged')

" Make sure you use single quotes
Plug 'junegunn/seoul256.vim'

" For correct install color schemes pls read these notes
" https://github.com/chriskempson/base16-vim
" https://github.com/chriskempson/base16-shell
" https://github.com/chriskempson/base16-iterm2
Plug 'chriskempson/base16-vim'

Plug 'easymotion/vim-easymotion'

call plug#end()

" | Color options | {{{
set background=dark
let base16colorspace=256
colors base16-railscasts
" Disable background and foreground for vertical split
hi vertsplit ctermbg=NONE guibg=NONE
" }}}