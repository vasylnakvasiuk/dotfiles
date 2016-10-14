" Map leader
let mapleader="\<Space>"

if filereadable(expand('~/.config/nvim/plugins.vim'))
  " Include plugins list
  source ~/.config/nvim/plugins.vim
endif

if filereadable(expand('~/.config/nvim/keymap.vim'))
  " Include plugins list
  source ~/.config/nvim/keymap.vim
endif

" Enable line numbers
set number

" Highlight current line
set cursorline

" Set lazy redraw for smooth scrolling
set lazyredraw

" Case-insensitive search
set ignorecase

" Turn off show mode on the status line
set noshowmode

" Keep undo history for all file changes
set undofile

" Set scroll offset – number of context lines you would like to see above and below the cursor
set scrolloff=5

" Turn on whitespace highlight
set list listchars=tab:▸\ ,trail:⋅,nbsp:⋅

" Nice split theme
hi VertSplit ctermfg=18 ctermbg=18
" | Color options | }}}

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
