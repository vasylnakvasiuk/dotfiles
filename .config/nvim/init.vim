let mapleader="," " Map leader

if filereadable(expand('~/.config/nvim/plugins.vim'))
  " Include plugins list
  source ~/.config/nvim/plugins.vim
endif

set number " Enable line numbers
set cursorline " Highlight current line

" | Color options | {{{
set background=dark
let base16colorspace=256
colorscheme base16-eighties
" | Color options | }}}

" Remove search highlight
nmap <silent> <space> :nohlsearch<CR>

" Trim whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

autocmd FileType python set colorcolumn=80
