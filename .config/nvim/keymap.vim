" Remove search highlight
nmap <silent> <CR> :nohlsearch<CR>
nnoremap <silent> j j:nohl<CR>
nnoremap <silent> k k:nohl<CR>

" Fast file save
nnoremap <silent> <leader>w :update<CR>

" Quit all files
nnoremap <silent> Zx :qall<CR>

" Quit and discard all files
nnoremap <silent> ZX :qall!<CR>

" Tricky scroll
nnoremap <C-J> 3<C-E>3j
nnoremap <C-K> 3<C-Y>3k

" By default Y == yy, so add new useful keymap
nnoremap Y y$

" Bye-bye Ex mode, hello repeat q macros
nnoremap Q @q

" Fast tab switch
nnoremap <silent> <C-l> :tabnext<CR>
nnoremap <silent> <C-h> :tabprev<CR>
