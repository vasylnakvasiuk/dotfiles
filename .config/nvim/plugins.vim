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
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'tpope/vim-unimpaired'
Plug 'Valloric/ListToggle'
Plug 'dyng/ctrlsf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'Shougo/junkfile.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'szw/vim-maximizer'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/neosnippet.vim'
Plug 'honza/vim-snippets'

Plug 'kana/vim-textobj-user'
Plug 'sgur/vim-textobj-parameter'

" Python plugins
Plug 'voithos/vim-python-matchit', {'for': 'python'}
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'fisadev/vim-isort', {'for': 'python'}
Plug 'kh3phr3n/python-syntax', {'for': 'python'}
Plug 'michaeljsmith/vim-indent-object', {'for': 'python'}
Plug 'nathanaelkane/vim-indent-guides', {'for': 'python'}

" HTML plugin: Highlight enclosing tags
Plug 'Valloric/MatchTagAlways', {'for': ['xml', 'html', 'jinja', 'htmldjango']}

" Enhancement internal functional
Plug 'junegunn/vim-peekaboo'
Plug 'unblevable/quick-scope'
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
nnoremap <leader>a :FzfAg<space>
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
let g:jedi#smart_auto_mappings = 1
let g:jedi#auto_vim_configuration = 0
let g:jedi#show_call_signatures = 0

" Remap all jedi keys
let g:jedi#goto_command = "<leader>jj"
let g:jedi#goto_assignments_command = "<leader>jg"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>ju"
let g:jedi#completions_command = ""
let g:jedi#rename_command = "<leader>jr"

set completeopt-=preview
" | jedi-vim | }}}


" | python-syntax | {{{
let python_highlight_all = 1
" | python-syntax | }}}


" | unblevable/quick-scope | {{{
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" | unblevable/quick-scope | }}}


" | szw/vim-maximizer | {{{
let g:maximizer_set_default_mapping = 0
nnoremap <silent> <leader>z :MaximizerToggle<CR>
" | szw/vim-maximizer | }}}


" | neomake/neomake | {{{
let g:neomake_verbose = 0
let g:neomake_python_enabled_makers = ['flake8']
autocmd! BufWritePost,BufEnter * Neomake
" | neomake/neomake | }}}


" | nathanaelkane/vim-indent-guides | {{{
hi IndentGuidesOdd  ctermbg=18
hi IndentGuidesEven ctermbg=18
nnoremap cog :IndentGuidesToggle<CR>
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
" | nathanaelkane/vim-indent-guides | }}}


" | Shougo/neosnippet.vim | {{{
let g:neosnippet#disable_runtime_snippets = {
            \   '_' : 1,
            \ }
let g:neosnippet#snippets_directory=glob('~/.config/nvim/plugged/vim-snippets/snippets')

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" | Shougo/neosnippet.vim | }}}
