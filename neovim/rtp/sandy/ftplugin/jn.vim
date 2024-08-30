if exists("b:did_ftplugin")
  finish
endif

nnoremap <buffer> <F9> :/@section<CR>zt
nnoremap <buffer> <F7> :?@section<CR>zt
nnoremap <buffer> <F10> zM
nnoremap <buffer> <F11> za
nnoremap <buffer> <F12> zR

ab sub <sub></sub><Esc>5hi
ab sup <sup></sup><Esc>5hi

let b:did_ftplugin = 1
