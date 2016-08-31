" Remove search highlight
nmap <silent> <leader><CR> :nohlsearch<CR>
nnoremap <silent> j j:nohlsearch<CR>
nnoremap <silent> k k:nohlsearch<CR>

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
nnoremap <silent> <C-W>t :tabnew<CR>
nnoremap <silent> <C-L> :tabnext<CR>
nnoremap <silent> <C-H> :tabprev<CR>
