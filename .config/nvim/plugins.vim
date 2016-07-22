" Automatic installation
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'dyng/ctrlsf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'henrik/vim-indexed-search'
Plug 'Shougo/junkfile.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-peekaboo'
Plug 'pgdouyon/vim-evanesco'

Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'zchee/deoplete-jedi', {'for': 'python'}
Plug 'kh3phr3n/python-syntax', {'for': 'python'}

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

call plug#end()


" | vim-airline | {{{
" Use airline fonts
let g:airline_powerline_fonts = 1

" Enable enhanced tabline
let g:airline#extensions#tabline#enabled = 1

" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'
" | vim-airline | }}}


" | fzf | {{{
let g:fzf_command_prefix = 'Fzf'

nnoremap <silent> <C-P> :FzfFiles<CR>

" Ctrl + / for buffer lines search
nnoremap <silent> <C-_> :FzfBLines<CR>

nnoremap <silent> <leader>b :FzfBuffers<CR>
nnoremap <silent> <leader>r :FzfHistory<CR>
nnoremap <silent> <leader>q/ :FzfHistory/<CR>
nnoremap <silent> <leader>q: :FzfHistory:<CR>
nnoremap <silent> <leader>p :FzfCommands<CR>
nnoremap <silent> <leader>t :FzfBTags<CR>
nnoremap <silent> <leader>T :FzfTags<CR>
nnoremap <silent> <leader>g :FzfGFiles?<CR>
nnoremap <silent> <leader>G :FzfGFiles<CR>

let g:fzf_tags_command = 'ctags --languages=python --python-kinds=-iv -R'
let g:fzf_history_dir = '~/.fzf-history'
" | fzf | }}}


" | junkfile | {{{
nmap <leader>n :JunkfileOpen<space>
" | junkfile | }}}


" | NERDTree | {{{

" Toggle NERD tree window
nmap <silent> <leader>m :NERDTreeToggle<CR>

" Find the current file in the tree
nmap <silent> <leader>M :NERDTreeFind<CR>

" Will open up a window level NERD tree instead of a netrw in the target window
let g:NERDTreeHijackNetrw = 1
" | NERDTree | }}}


" | CtrlSF | {{{
let g:ctrlsf_position = 'bottom'

nmap <leader>f/ <Plug>CtrlSFPrompt
vmap <leader>f* <Plug>CtrlSFVwordPath
nmap <leader>f* <Plug>CtrlSFCwordPath
nmap <leader>ff <Plug>CtrlSFCwordPath<CR>
nmap <leader>fn <Plug>CtrlSFPwordPath
nnoremap <leader>ft :CtrlSFToggle<CR>
" | CtrlSF | }}}


" | vim-gitgutter | {{{
" Reduce the delay of updating sign column to 250ms
set updatetime=250
" | vim-gitgutter | }}}


" | deoplete | {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_refresh_always = 1
" | deoplete | }}}


" | delimitMate | {{{
" Turns on the expansion of <CR>
let delimitMate_expand_cr = 1

" Go outside quotes, parens, brackets, etc. (Duplicate for S-Tab)
imap <C-L> <Plug>delimitMateS-Tab

" Put triple quotes on the separate line after <CR>
au FileType python let b:delimitMate_expand_inside_quotes = 1

" Helpful for triple quotes
au FileType python let b:delimitMate_nesting_quotes = ["'"]
" | delimitMate | }}}


" | jedi-vim | {{{
" Disable jedi completions
let g:jedi#completions_enabled = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#auto_vim_configuration = 0

" Remap all jedi keys
let g:jedi#goto_command = "<leader>jj"
let g:jedi#goto_assignments_command = "<leader>jg"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>ju"
let g:jedi#completions_command = ""
let g:jedi#rename_command = "<leader>jr"
" | jedi-vim | }}}


" | python-syntax | {{{
let python_highlight_all = 1
" | python-syntax | }}}
