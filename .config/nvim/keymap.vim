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

" Use \ instead of , (repeat latest char jump in opposite direction)
nnoremap \ ,

" By default Y == yy, so add new useful keymap
nnoremap Y y$

" Bye-bye Ex mode, hello repeat q macros
nnoremap Q @q
