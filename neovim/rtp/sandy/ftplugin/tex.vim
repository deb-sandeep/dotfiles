if exists("b:did_ftplugin")
  finish
endif

nnoremap <buffer> <F3> :w<CR>
nnoremap <buffer> <F9> :/@section<CR>zt
nnoremap <buffer> <F7> :?@section<CR>zt
nnoremap <buffer> <F10> zM
nnoremap <buffer> <F11> za
nnoremap <buffer> <F12> zR

nnoremap <buffer> <Bslash> 2dd
nnoremap <buffer> <Bslash><Bslash> dd

let b:did_ftplugin = 1
