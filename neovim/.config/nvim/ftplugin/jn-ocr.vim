if exists("b:did_ftplugin")
  finish
endif

function! CleanRawFile()
  normal mZ
  let l:chars = col("$")
  %s/\s\+$//e
  %s/\s\s\+/ /e
  if (line("'Z") != line(".")) || (l:chars != col("$"))
    echom "Trailing whitespace stripped\n"
  endif
  normal `Z
endfunction

nnoremap <buffer> <F1> gewi_<Esc>ea_<Esc>w
nnoremap <buffer> <F2> gewi_<Esc>eWea_<Esc>w
nnoremap <buffer> <F3> xf_xw
nnoremap <buffer> <F9> :/@section<CR>zt
nnoremap <buffer> <F7> :?@section<CR>zt
nnoremap <buffer> <F10> zM
nnoremap <buffer> <F11> za
nnoremap <buffer> <F12> zR

nnoremap <buffer> <Bslash> 2dd

nnoremap <buffer> <leader>D :call CleanRawFile()<CR>

let b:did_ftplugin = 1
