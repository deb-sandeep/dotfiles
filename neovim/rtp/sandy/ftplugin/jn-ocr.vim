if exists("b:did_ftplugin")
  finish
endif

function! CleanRawFile()
  normal mZ
  let l:chars = col("$")
  %s/\s\+$//e
  %s/\s\s/ /g
  "%s/\.\([A-Za-z]\)/ \1/g
  %s/\s\+\.$/\./
  %s/\s\+:/:/g
  %s/\s\+?/?/g
  if (line("'Z") != line(".")) || (l:chars != col("$"))
    echom "Trailing whitespace stripped\n"
  endif
  normal `Z
endfunction

nnoremap <buffer> <leader>ve :sp ~/.my/dotfiles/neovim/rtp/sandy/ftplugin/jn-ocr.vim<CR>
nnoremap <buffer> <leader>vs :unlet b:did_ftplugin<CR>:so ~/.my/dotfiles/neovim/rtp/sandy/ftplugin/jn-ocr.vim<CR>

nnoremap <buffer> <F1> gewi_<Esc>ea_<Esc>w
nnoremap <buffer> <F2> gewi_<Esc>eWea_<Esc>w
nnoremap <buffer> <F9> :/@section<CR>zt
nnoremap <buffer> <F7> :?@section<CR>zt
nnoremap <buffer> <F10> zM
nnoremap <buffer> <F11> za
nnoremap <buffer> <F12> zR

nnoremap <buffer> <Bslash> 2dd
nnoremap <buffer> <Bslash><Bslash> dd
nnoremap <buffer> <leader>D :call CleanRawFile()<CR>
nnoremap <buffer> _ i_<Esc> 
nnoremap <buffer> - W
nnoremap <buffer> = )
nnoremap <buffer> <A-8> bwi**<Esc>ea**<Esc>w

nmap     <buffer> <F4> dt i\\(<Esc>pa\\)<Esc>
vmap     <buffer> <F4> xi\\(<Esc>pa\\)<Esc>

nmap     <buffer> da( da(x
nmap     <buffer> da) da)x

ab sub <sub></sub><Esc>5hi
ab sup <sup></sup><Esc>5hi
ab teh the

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

" Moves the // METANOTE END marker from its current position to 
" the line the cursor in in.
let @m='O// METANOTE ENDgg/METANOTE ENDddnzz'

" Makes the current line into a bulleted chemical equation
let @c='I    * {{@ichem A}}'

let b:did_ftplugin = 1
