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

" Easy quit
nnoremap <C-q> :q<CR>

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
nnoremap <silent> ]t :tabnext<CR>
nnoremap <silent> [t :tabprev<CR>

" Close quickfix and location lists
nnoremap <leader>c :cclose<bar>lclose<cr>

" Switch results from quickfix list
nnoremap <left> :cprev<CR>zz
nnoremap <right> :cnext<CR>zz
nnoremap <S-left> :cpfile<CR>zz
nnoremap <S-right> :cnfile<CR>zz
nnoremap [q :cprev<CR>zz
nnoremap ]q :cnext<CR>zz
nnoremap ]Q :cnfile<CR>zz
nnoremap [Q :cpfile<CR>zz

" Switch results from location list
nnoremap <up> :lprev<CR>zz
nnoremap <down> :lnext<CR>zz
nnoremap <S-up> :lnfile<CR>zz
nnoremap <S-down> :lpfile<CR>zz
nnoremap [l :lprev<CR>zz
nnoremap ]l :lnext<CR>zz
nnoremap [L :lpfile<CR>zz
nnoremap ]L :lnfile<CR>zz

" Visual mode -- moving lines
xnoremap <silent> <C-k> :move-2<CR>gv
xnoremap <silent> <C-j> :move'>+<CR>gv
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv

" Insert blank lines above or belowe the cursor
nnoremap <silent> [<space> :pu! _<CR>:']+1<cr>
nnoremap <silent> ]<space> :pu _<CR>:'[-1<cr>

" Jump to tag smartly
nnoremap <C-]> g<C-]>
