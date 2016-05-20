" Map leader
let mapleader=","
nnoremap <leader><leader> ,

if filereadable(expand('~/.config/nvim/plugins.vim'))
  " Include plugins list
  source ~/.config/nvim/plugins.vim
endif

" Enable line numbers
set number

" Highlight current line
set cursorline

" Case-insensitive search
set ignorecase

" Set scroll offset – number of context lines you would like to see above and below the cursor
set scrolloff=5

" Turn on whitespace highlight
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" Use system clipboard
set clipboard=unnamed

" | Color options | {{{
set background=dark
let base16colorspace=256
colorscheme base16-eighties
" | Color options | }}}

" Remove search highlight
nmap <silent> <space> :nohlsearch<CR>

" Fast file save
nnoremap <silent> <leader><leader> :update<CR>

" Quit all files
nnoremap <silent> Zx :qall<CR>

" Quit and discard all files
nnoremap <silent> ZX :qall!<CR>

" Tricky scroll
nnoremap <C-J> 3<C-E>3j
nnoremap <C-K> 3<C-Y>3k

" Trim whitespace on save
fun! TrimWhitespace()
    let l:save_cursor = getpos('.')
    %s/\s\+$//e
    call setpos('.', l:save_cursor)
endfun
autocmd BufWritePre * :call TrimWhitespace()

" Display vertical line at 80 columns
autocmd FileType python set colorcolumn=80

" Setup python path
if filereadable(glob('~/.virtualenvs/neovim3/bin/python'))
    let g:python3_host_prog = glob('~/.virtualenvs/neovim3/bin/python')
endif
if filereadable(glob('~/.virtualenvs/neovim2/bin/python'))
    let g:python_host_prog = glob('~/.virtualenvs/neovim2/bin/python')
endif
