function! s:CurrentDate()
    return strftime("%d-%m-%y")
endfunction

function! s:EchoFailure(message)
    echohl ErrorMsg
    echo a:message
    echohl None
endfunction

let s:plug_snapshot_dir = expand('~/.config/nvim/plug-snapshots/')
" Path to the current snapshot
let s:plug_snapshot_path = s:plug_snapshot_dir.s:CurrentDate()

function! s:SafePlugUpdate() abort
    " Create directory for snapshots if not exist
    execute 'silent !mkdir '.s:plug_snapshot_dir.' &> /dev/null'

    echom "Save plug snapshot to ".s:plug_snapshot_path
    execute "silent PlugSnapshot!".s:plug_snapshot_path
    " Delete buffer after saving a snapshot
    execute "silent bd plug-snapshot"

    echom "Update plugins..." | execute "PlugUpdate"
endfunction

function! s:PlugRevert() abort
    if filereadable(s:plug_snapshot_path)
        echom "Restore plug state from ".s:plug_snapshot_path
        execute "source ".s:plug_snapshot_path
    else
        call s:EchoFailure("Snapshot for today (".s:CurrentDate().") not found!")
    endif
endfunction

command! SafePlugUpdate call s:SafePlugUpdate()
command! PlugRevert call s:PlugRevert()

" Fzfag operator (I suppose this func should be global)
function! g:_Fzf_ag(type) abort
    " Save register contents
    let l:orig = @@
    if a:type ==# 'char'
        execute "normal! `[v`]y"
        let l:query = @@
        " Restore register contents
        let @@ = l:orig
        execute "Ag ".l:query
    elseif a:type ==# 'line'
        call s:EchoFailure('fzfag operator does not support linewise modes!')
    endif
endfunction

call operator#user#define('fzfag', 'g:_Fzf_ag')
map gh <Plug>(operator-fzfag)
