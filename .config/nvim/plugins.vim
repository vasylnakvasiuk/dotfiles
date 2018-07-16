" Automatic installation
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/unite.vim'
Plug 'Valloric/ListToggle'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'Shougo/junkfile.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ryanoasis/vim-devicons'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-eunuch'
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make'}

Plug 'kana/vim-textobj-user'
Plug 'sgur/vim-textobj-parameter'
Plug 'kana/vim-operator-user'

" Python plugins
Plug 'kh3phr3n/python-syntax', {'for': 'python'}
Plug 'michaeljsmith/vim-indent-object', {'for': 'python'}

" HTML plugin: Highlight enclosing tags
Plug 'Valloric/MatchTagAlways', {'for': ['xml', 'html', 'jinja', 'htmldjango']}

" Enhancement internal functional
Plug 'junegunn/vim-peekaboo'
Plug 'thinca/vim-visualstar'
Plug 'henrik/vim-indexed-search'

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

call plug#end()


" | chriskempson/base16-vim | {{{
" Color options
set background=dark
let base16colorspace=256
colorscheme base16-eighties
" | chriskempson/base16-vim | }}}


" | vim-airline | {{{
" Use airline fonts
let g:airline_powerline_fonts = 1

" Enable enhanced tabline
let g:airline#extensions#tabline#enabled = 1

" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'

" Do not show buffers in tabline
let g:airline#extensions#tabline#show_buffers = 0

" Use syntastic extension
let g:airline#extensions#syntastic#enabled = 1

" Hide close button for windows
let g:airline#extensions#tabline#show_close_button = 0

" Set airline theme
let g:airline_theme='base16'
let g:airline_base16_improved_contrast = 1
" | vim-airline | }}}


" | fzf | {{{
let g:fzf_command_prefix = 'Fzf'

nnoremap <silent> <C-P> :FzfFiles<CR>

nnoremap <silent> <leader>/ :FzfBLines<CR>
nnoremap <silent> <leader>b :FzfBuffers<CR>
nnoremap <silent> <leader>r :FzfHistory<CR>
nnoremap <silent> <leader>g/ :FzfHistory/<CR>
nnoremap <silent> <leader>g: :FzfHistory:<CR>
nnoremap <silent> <leader>p :FzfCommands<CR>
nnoremap <silent> <leader>t :FzfBTags<CR>
nnoremap <silent> <leader>T :FzfTags<CR>
nnoremap <silent> <leader>gf :FzfGFiles?<CR>
nnoremap <silent> <leader>gF :FzfGFiles<CR>

imap <c-x><c-l> <plug>(fzf-complete-line)
imap <c-x><c-f> <plug>(fzf-complete-path)

autocmd VimEnter * command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 '--hidden',
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

let g:fzf_tags_command = 'ctags --languages=python --python-kinds=-iv -R'
let g:fzf_history_dir = '~/.fzf-history'

nnoremap <leader>gh :Ag<space>
" | fzf | }}}


" | junkfile | {{{
nmap <leader>n :JunkfileOpen<space>
" | junkfile | }}}


" | vim-gitgutter | {{{
" Reduce the delay of updating sign column to 250ms
set updatetime=250

" Nice uniform gitgutter signs
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '▎'
let g:gitgutter_sign_removed = '▎'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▎'

let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
nnoremap <silent> cog :GitGutterLineHighlightsToggle<cr>
" | vim-gitgutter | }}}


" | deoplete | {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_refresh_always = 1
" | deoplete | }}}


" | python-syntax | {{{
let python_highlight_all = 1
" | python-syntax | }}}
