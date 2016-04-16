" Automatic installation
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" For correct install color schemes please read these notes
" https://github.com/chriskempson/base16-vim
" https://github.com/chriskempson/base16-shell
" https://github.com/chriskempson/base16-iterm2
Plug 'chriskempson/base16-vim'

" Lean & mean status/tabline for vim that's light as air
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'dyng/ctrlsf.vim'
Plug 'rking/ag.vim'

call plug#end()


" | vim-airline | {{{
" Use airline fonts
let g:airline_powerline_fonts = 1

" Enable enhanced tabline
let g:airline#extensions#tabline#enabled = 1

" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'
" | vim-airline | }}}


" | ctrlp + Silver Searcher | {{{
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" | ctrlp + Silver Searcher | }}}


" | NERDTree | {{{
" Find the current file in the tree
nmap <silent> ,n :NERDTreeFind<CR>

" Toggle NERD tree window
nmap <silent> ,m :NERDTreeToggle<CR>

" Will open up a window level NERD tree instead of a netrw in the target window
let g:NERDTreeHijackNetrw = 1
" | NERDTree | }}}


" | CtrlSF | {{{
let g:ctrlsf_position = 'bottom'

" bind K to grep word under cursor
nmap <C-J>f <Plug>CtrlSFPrompt
vmap <C-J>f <Plug>CtrlSFVwordPath
vmap <C-J>F <Plug>CtrlSFVwordExec
nmap <C-J>n <Plug>CtrlSFCwordPath
nmap <C-J>p <Plug>CtrlSFPwordPath
nnoremap <C-J>o :CtrlSFOpen<CR>
nnoremap <C-J>t :CtrlSFToggle<CR>
inoremap <C-J>t <Esc>:CtrlSFToggle<CR>
" | CtrlSF | }}}
