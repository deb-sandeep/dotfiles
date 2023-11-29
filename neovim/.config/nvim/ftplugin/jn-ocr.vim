if exists("b:did_ftplugin")
  finish
endif

nnoremap <buffer> <F1> gewi_<Esc>ea_<Esc>w
nnoremap <buffer> <F2> gewi_<Esc>eWea_<Esc>w
nnoremap <buffer> <F3> xf_xw
nnoremap <buffer> <F9> :/@section<CR>zt
nnoremap <buffer> <F7> :?@section<CR>zt
nnoremap <buffer> <F10> zM
nnoremap <buffer> <F11> za
nnoremap <buffer> <F12> zR

nnoremap <buffer> <Bslash> 2dd

let b:did_ftplugin = 1
