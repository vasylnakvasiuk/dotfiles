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
nnoremap <C-j> 3<C-E>3j
vnoremap <C-j> 3<C-E>3j
nnoremap <C-k> 3<C-Y>3k
vnoremap <C-k> 3<C-Y>3k

" By default Y == yy, so add new useful keymap
nnoremap Y y$

" Yank to system clipboard
nnoremap gy "+y
vnoremap gy "+y
nnoremap gY "+y$
vnoremap gY "+Y

" Paste from system clipboard
nnoremap gp "+p
vnoremap gp "+p
nnoremap gP "+P
vnoremap gP "+P

" Bye-bye Ex mode, hello repeat q macros
nnoremap Q @q

" Fast tab switch
nnoremap <silent> <C-W>t :tabnew<CR>
nnoremap <silent> <C-L> :tabnext<CR>
nnoremap <silent> <C-H> :tabprev<CR>
