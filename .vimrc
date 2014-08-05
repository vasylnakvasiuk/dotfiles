set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" List of plugins.
Plugin 'chriskempson/base16-vim'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'Lokaltog/vim-easymotion'
" TODO: snippets plugin
" TODO: tagbar plugin
" TODO: linter plugin

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" ==================== Base settings ====================

syntax on                         " show syntax highlighting
set autoindent                    " set auto indent
set ts=4                          " set indent to 4 spaces
set shiftwidth=4
set expandtab                     " use spaces, not tab characters
set noswapfile                    " don't use swapfile
set nobackup                      " don't create annoying backup files
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

" Remove the ugly splits separator
set fillchars+=vert:\ 

" ==================== Keymap settings ====================

" Turn off arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" Clear the command line and search highlighting
noremap <C-l> :nohlsearch<CR>

" This comes first, because we have mappings that depend on leader
" With a map leader it's possible to do extra key combinations
" i.e: <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Open a new empty buffer
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" ==================== Plugin settings ====================

" -------------------- CtrlP --------------------
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""' " use `ag` for custom file listing command
let g:ctrlp_working_path_mode = 'ra'                  " change where to find
let g:ctrlp_max_height = 30                           " maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'                      " jump to a file if it's open already
let g:ctrlp_max_files=0                               " do not limit the number of searchable files

" -------------------- vim-airline --------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_detect_whitespace=0

" -------------------- NERDTree --------------------
nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>

" ==================== Color settings ====================

" Access colors present in 256 colorspace
let base16colorspace=256

" Set dark background and color scheme
set background=dark
colorscheme base16-railscasts

" Set up some base custom colors
highlight SignColumn            ctermbg=236
highlight VertSplit             ctermbg=237
highlight LineNr                ctermbg=236 ctermfg=240
highlight CursorLineNr          ctermbg=236 ctermfg=240
highlight CursorLine            ctermbg=236
highlight IncSearch             ctermbg=3   ctermfg=1
highlight Search                ctermbg=1   ctermfg=3
highlight Visual                ctermbg=3   ctermfg=0
highlight Pmenu                 ctermbg=240 ctermfg=12
highlight PmenuSel              ctermbg=3   ctermfg=1

" Set up some vim-gitgutter custom colors
highlight GitGutterAdd          ctermbg=236
highlight GitGutterChange       ctermbg=236
highlight GitGutterDelete       ctermbg=236
highlight GitGutterChangeDelete ctermbg=236
highlight SignColumn            ctermbg=236

" Set up some vim-airline custom colors
let g:airline#themes#base16#palette = {}

" Color palette
let s:gui_dark_gray = '#202020'
let s:cterm_dark_gray = 234
let s:gui_med_gray_hi = '#303030'
let s:cterm_med_gray_hi = 236
let s:gui_med_gray_lo = '#3a3a3a'
let s:cterm_med_gray_lo = 237
let s:gui_light_gray = '#505050'
let s:cterm_light_gray = 239
let s:gui_green = '#00ff00'
let s:cterm_green = 10
let s:gui_blue = '#0000ff'
let s:cterm_blue = 12
let s:gui_orange = '#d28445'
let s:cterm_orange = 173
let s:gui_red = '#ac4142'
let s:cterm_red = 131
let s:gui_yellow = '#ffff00'
let s:cterm_yellow = 11

" Normal mode
let s:N1 = [s:gui_dark_gray, s:gui_green, s:cterm_dark_gray, s:cterm_green]
let s:N2 = [s:gui_light_gray, s:gui_med_gray_lo, s:cterm_light_gray, s:cterm_med_gray_lo]
let s:N3 = [s:gui_green, s:gui_med_gray_hi, s:cterm_green, s:cterm_med_gray_hi]
let g:airline#themes#base16#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#base16#palette.normal_modified = {
    \ 'airline_c': [s:gui_orange, s:gui_med_gray_hi, s:cterm_orange, s:cterm_med_gray_hi, ''],
    \ }

" Insert mode
let s:I1 = [s:gui_med_gray_hi, s:gui_blue, s:cterm_med_gray_hi, s:cterm_blue]
let s:I3 = [s:gui_blue, s:gui_med_gray_hi, s:cterm_blue, s:cterm_med_gray_hi]
let g:airline#themes#base16#palette.insert = airline#themes#generate_color_map(s:I1, s:N2, s:I3)
let g:airline#themes#base16#palette.insert_modified = copy(g:airline#themes#base16#palette.normal_modified)
let g:airline#themes#base16#palette.insert_paste = {
    \ 'airline_a': [s:gui_dark_gray, s:gui_orange, s:cterm_dark_gray, s:cterm_orange, ''],
    \ }

" Replace mode
let g:airline#themes#base16#palette.replace = {
    \ 'airline_a': [s:gui_dark_gray, s:gui_red, s:cterm_dark_gray, s:cterm_red, ''],
    \ 'airline_c': [s:gui_red, s:gui_med_gray_hi, s:cterm_red, s:cterm_med_gray_hi, ''],
    \ }
let g:airline#themes#base16#palette.replace_modified = copy(g:airline#themes#base16#palette.insert_modified)

" Visual mode
let s:V1 = [s:gui_dark_gray, s:gui_yellow, s:cterm_dark_gray, s:cterm_yellow]
let s:V3 = [s:gui_yellow, s:gui_med_gray_hi, s:cterm_yellow, s:cterm_med_gray_hi]
let g:airline#themes#base16#palette.visual = airline#themes#generate_color_map(s:V1, s:N2, s:V3)
let g:airline#themes#base16#palette.visual_modified = copy(g:airline#themes#base16#palette.insert_modified)

" Inactive window
let s:IA = [s:gui_dark_gray, s:gui_med_gray_hi, s:cterm_dark_gray, s:cterm_med_gray_hi, '']
let g:airline#themes#base16#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
let g:airline#themes#base16#palette.inactive_modified = {
    \ 'airline_c': [s:gui_orange, '', s:cterm_orange, '', ''],
    \ }
