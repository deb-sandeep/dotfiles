" JoveNotes source (.jn) syntax file
" Language    :	JoveNotes
" Maintainer  :	Sandeep Deb (deb.sandeep@gmail.com)

if exists("b:current_syntax")
  finish
endif

setlocal foldmethod=expr
setlocal foldexpr=GetJNFold(v:lnum)

function! GetJNFold(lnum)
    if getline(a:lnum) =~ '^//-\+$' || 
       \ getline(a:lnum) =~ '^@section .*$' ||
       \ getline(a:lnum) =~ '^subject ' ||
       \ getline(a:lnum) =~ '^chapterNumber ' ||
       \ getline(a:lnum) =~ '^chapterName '
        return '0'
    endif
    return '1'
endfunction

" Keyword definitions
syn keyword jnFileHeader         subject         nextgroup=jnString          skipwhite
syn keyword jnFileHeader         chapterNumber   nextgroup=jnDecimal         skipwhite
syn keyword jnFileHeader         chapterName     nextgroup=jnString          skipwhite

syn keyword jnSection            @section        nextgroup=jnSectionName     skipwhite
syn region  jnSectionName        start='"'  end='"' contained
"syn match   jnSectionHeader      '//-\+$'

syn keyword jnNotesType          @qa
syn keyword jnNotesType          @fib
syn keyword jnNotesType          @true_false
syn keyword jnNotesType          @multi_choice
syn keyword jnNotesType          @exercise
syn keyword jnNotesType          @chem_compound
syn keyword jnNotesType          @definition
syn keyword jnNotesType          @exercise
syn keyword jnNotesType          @match
syn keyword jnNotesType          @rtc
syn keyword jnNotesType          @wm
syn keyword jnNotesAttribute     @options @numOptionsPerRow @numOptionsToShow @mcq_config correct false @forwardCaption @reverseCaption

syn match   jnDecimal            '\d\+\.\d\+'
syn region  jnString             start=+"+     end=+"+    contains=jnItalicsString,jnBoldString,jnFibSlot,jnTextEnhancer
syn region  jnItalicsString      start='_'     end='_'    contained
syn region  jnBoldString         start='\*\*'  end='\*\*' contained
syn region  jnFibSlot            start='{'     end='}'    contained
syn region  jnTextEnhancer       start='{{'    end='}}'   contained contains=jnTextEnhancerAttr,jnTdTh
syn keyword jnTextEnhancerAttr   @table @chem @cfig @math @ichem @imath
syn keyword jnTdTh               @th @td

hi def link jnFileHeader         Type
hi def link jnSection            Type
hi def link jnSectionName        Number
"hi def link jnSectionHeader      Label
hi def link jnNotesType          Keyword
hi def link jnNotesAttribute     Type
hi def link jnDecimal            Number
hi def link jnString             String
hi def link jnItalicsString      Italic
hi def link jnBoldString         Bold
hi def link jnFibSlot            Special
hi def link jnTextEnhancer       None
hi def link jnTextEnhancerAttr   Special
hi def link jnTdTh               Type

" Single line comment
"----------------------------------------------------------------------------------
syn match jnSingleLineComment      '^//.*$'
hi  jnSingleLineComment guifg='#505050'

let b:current_syntax = "jn"




