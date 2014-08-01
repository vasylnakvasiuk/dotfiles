noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" List of plugins.
Plugin 'kien/ctrlp.vim'
" Plugin 'bling/vim-airline'
" Plugin 'tpope/vim-commentary'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
" Plugin 'scrooloose/nerdtree'
" Plugin 'Lokaltog/vim-easymotion'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"
" Settings
"

"
" Base settings
"

syntax on                         " show syntax highlighting
set autoindent                    " set auto indent
set ts=4                          " set indent to 4 spaces
set shiftwidth=4
set expandtab                     " use spaces, not tab characters
set noswapfile                    " Don't use swapfile
set nobackup                      " Don't create annoying backup files
set relativenumber                " show relative line numbers
set showmatch                     " show bracket matches
set ignorecase                    " ignore case in search
set hlsearch                      " highlight all search matches
set cursorline                    " highlight current line
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I type
set mouse=a                       " enable mouse support
set ttimeoutlen=100               " decrease timeout for faster insert with 'O'
set vb                            " enable visual bell (disable audio bell)
set ruler                         " show row and column in footer
set scrolloff=2                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
set list listchars=tab:»·,trail:· " show extra space characters
set nofoldenable                  " disable code folding
set wildmenu                      " enable bash style tab completion
set wildmode=list:longest,full

" clear the command line and search highlighting
noremap <C-l> :nohlsearch<CR>

" This comes first, because we have mappings that depend on leader
" With a map leader it's possible to do extra key combinations
" i.e: <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

"
" Plugin Settings
"

" ==================== CtrlP ====================
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""' " use `ag` for custom file listing command
let g:ctrlp_working_path_mode = 'ra'                  " change where to find
let g:ctrlp_max_height = 30                           " maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'                      " jump to a file if it's open already
let g:ctrlp_max_files=0                               " do not limit the number of searchable files

" ==================== Other ====================
" vim-airline settings.
" let g:airline_powerline_fonts = 1

" put git status, column/row number, total lines, and percentage in status
" set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]

"
" Color settings
"

" set dark background and color scheme
set background=dark
colorscheme base16-railscasts

" set up some custom colors
highlight clear SignColumn
highlight VertSplit    ctermbg=236
highlight ColorColumn  ctermbg=237
highlight LineNr       ctermbg=236 ctermfg=240
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=236
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight StatusLine   ctermbg=240 ctermfg=12
highlight IncSearch    ctermbg=3   ctermfg=1
highlight Search       ctermbg=1   ctermfg=3
highlight Visual       ctermbg=3   ctermfg=0
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=3   ctermfg=1
highlight SpellBad     ctermbg=0   ctermfg=1
