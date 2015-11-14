" Automatic installation
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" For correct install color schemes pls read these notes
" https://github.com/chriskempson/base16-vim
" https://github.com/chriskempson/base16-shell
" https://github.com/chriskempson/base16-iterm2
Plug 'chriskempson/base16-vim'

" Lean & mean status/tabline for vim that's light as air
Plug 'bling/vim-airline'

" Vim motions on speed!
Plug 'easymotion/vim-easymotion'

call plug#end()

" | vim-airline | {{{
let g:airline_powerline_fonts = 1 " Use airline fonts
" If you want to auto-completion to work stable in older vim, disable this option
let g:airline#extensions#tabline#enabled = 1
" Airline tabline settings
let g:airline#extensions#tabline#fnamemod = ':t'