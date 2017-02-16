let s:date = strftime("%d-%m-%y")
let s:plug_snapshot_path = expand('~/.config/nvim/plug-snapshots/'.s:date)

function! s:SafePlugUpdate()
    " Create a snapshot and save it
    execute "silent PlugSnapshot!".s:plug_snapshot_path
    " Delete buffer after saving a snapshot
    execute "silent bd plug-snapshot"
    " Update plugins as usual
    execute "PlugUpdate"
endfunction
command! SafePlugUpdate call s:SafePlugUpdate()

function! s:PlugRevert()
    if filereadable(s:plug_snapshot_path)
        execute "source ".s:plug_snapshot_path
    else
        let l:msg = "Snapshot for today (".s:date.") not found!"
        execute "silent echohl ErrorMsg"
        execute 'echo "'.l:msg.'"'
        execute "silent echohl Normal"
    endif
endfunction
command! PlugRevert call s:PlugRevert()
