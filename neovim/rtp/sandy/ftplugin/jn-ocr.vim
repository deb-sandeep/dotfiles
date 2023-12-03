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

nnoremap <buffer> <leader>ve :sp ~/.my/dotfiles/neovim/rtp/sandy/ftplugin/jn-ocr.vim<CR>
nnoremap <buffer> <leader>vs :unlet b:did_ftplugin<CR>:so ~/.my/dotfiles/neovim/rtp/sandy/ftplugin/jn-ocr.vim<CR>

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
nnoremap <buffer> _ i_<Esc> 
nnoremap <buffer> - W
nnoremap <buffer> <A-8> bwi**<Esc>ea**<Esc>w

" Saved macros
" Turns the current statement into a @true statement
let @t='0lcwtruej'

" Turns the current statement into a @false statement
" Before: 
"     This is a dog.
" After: 
"     @false This is a dog.
"     This is a dog.
"     --
let @f='0lcwfalselly$P€ü€kb€kr$0$o--?falsew'

let b:did_ftplugin = 1
