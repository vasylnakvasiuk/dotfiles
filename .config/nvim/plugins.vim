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
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/unite.vim'
Plug 'w0rp/ale'
Plug 'Valloric/ListToggle'
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
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-eunuch'
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'mbbill/undotree'

Plug 'kana/vim-textobj-user'
Plug 'sgur/vim-textobj-parameter'
Plug 'kana/vim-operator-user'

" Python plugins
Plug 'voithos/vim-python-matchit', {'for': 'python'}
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}
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


" | vimfiler | {{{
" Edit files double clicking with mouse in vimfiler
autocmd FileType vimfiler nmap <buffer> <2-LeftMouse> <Plug>(vimfiler_edit_file)

" I'm used to switch splits with <c-l>, not <Tab>
autocmd FileType vimfiler map <buffer> <c-l> <Plug>(vimfiler_switch_to_other_window)
autocmd FileType vimfiler map <buffer> <Space> zz
autocmd BufEnter vimfiler :AirlineRefresh<cr>

nnoremap <silent> <leader>f :VimFilerExplorer -find<cr>
nnoremap <silent> - :VimFilerExplorer -find<cr>

let g:vimfiler_quick_look_command = 'qlmanage -p'
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_tree_opened_icon = '▼'
let g:vimfiler_tree_closed_icon = '▷'
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_ignore_pattern = ['^\.git$', '^\.DS_Store$', '^__pycache__$']
" | vimfiler | }}}


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


" | w0rp/ale | {{{
let g:ale_lint_on_save = 1
let g:ale_lint_delay = 250

" Use quickfix list
let g:ale_set_quickfix = 1
let g:ale_set_loclist = 0

" Change ALE highlight colors
highlight ALEErrorSign ctermbg=18 ctermfg=red
highlight ALEWarningSign ctermbg=18 ctermfg=yellow

" let g:ale_sign_warning = ''
" let g:ale_sign_error = ''
let g:ale_sign_warning = '✖'
let g:ale_sign_error = '⚠'
nmap <silent> [e <Plug>(ale_previous_wrap)
nmap <silent> ]e <Plug>(ale_next_wrap)
" E501 -- line too long
" E402 -- import not at top of file
" E128 -- continuation line underindented
" E225 -- missing whitespace around operator
" E231 -- missing whitespace after ','
" F403 -- import * used, unable to detect undefined names
" F405 -- name may be undefined, or defined from * imports
" E126 -- indentation error
let g:ale_python_flake8_args = '--ignore=E501,E402,E128,E225,E231,F403,F405,E126'
" | w0rp/ale | }}}


" | nathanaelkane/vim-indent-guides | {{{
hi IndentGuidesOdd  ctermbg=18
hi IndentGuidesEven ctermbg=18
nnoremap cog :IndentGuidesToggle<CR>
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
" | nathanaelkane/vim-indent-guides | }}}


" | SirVer/ultisnips | {{{
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" | SirVer/ultisnips | }}}


" | mbbill/undotree | {{{
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 2
nnoremap U :UndotreeToggle<CR>
" | mbbill/undotree | }}}
