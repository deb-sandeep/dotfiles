" JoveNotes OCR source (.jn-ocr) syntax file
" Language    :	JoveNotes OCR (Meta data to JN)
" Maintainer  :	Sandeep Deb (deb.sandeep@gmail.com)

if exists("b:current_syntax")
  finish
endif

echom( 'Loading syntax jn-ocr' )

setlocal foldmethod=expr
setlocal foldexpr=GetJNOCRFold(v:lnum)

function! GetJNOCRFold(lnum)
    if getline(a:lnum) =~ '^// -\+$' || 
       \ getline(a:lnum) =~ '^@section .*$' ||
       \ getline(a:lnum) =~ '^// METANOTE .*$' ||
       \ getline(a:lnum) =~ '^// here$' 
        return '0'
    endif
    return '1'
endfunction

highlight Normal guifg=Gray

" Section header
"----------------------------------------------------------------------------------
syn match   jnSectionHeader      '// -\+$|//-\+$'
syn keyword jnSection            @section nextgroup=jnSectionName skipwhite
syn region  jnSectionName        start='"' end='"' contained

hi def link jnSectionHeader      Label
hi def link jnSection            Type
hi def link jnSectionName        Number

" Sub-Section header
"----------------------------------------------------------------------------------
syn match   jnSubSectionHeader   '^## ' nextgroup=jnSubSectionName skipwhite
syn region  jnSubSectionName     start='.'  end='$' contained

hi jnSubSectionHeader guifg='Orange'
hi jnSubSectionName   guifg='Orange'

" Subsub-Section header
"----------------------------------------------------------------------------------
syn match   jnSubSubSectionHeader   '^### ' nextgroup=jnSubSubSectionName skipwhite
syn region  jnSubSubSectionName     start='.'  end='$' contained

hi jnSubSubSectionHeader guifg='Green'
hi jnSubSubSectionName   guifg='Green' gui=italic

" QA note type
"----------------------------------------------------------------------------------
syn keyword jnQANoteType @qa nextgroup=jnQAQuestionText skipwhite
syn region  jnQAQuestionText contained 
      \ start="." end="$"    
      \ contains=jnItalic,jnBold,jnTextDecorator 
      \ nextgroup=jnQAAnswerText skipwhite skipnl skipempty
syn region  jnQAAnswerText contained 
      \ start="." end="^--$" 
      \ contains=jnItalic,jnBold,jnBullet,jnTextDecorator

hi jnQANoteType     guifg='#c778dd' gui=bold
hi jnQAQuestionText guifg='#c4bb65'
hi jnQAAnswerText   guifg='#00ab9e'

" ChemEquation note type
"----------------------------------------------------------------------------------
syn keyword jnChemEqNoteType @chem_equation nextgroup=jnChemEqText skipwhite
syn region  jnChemEqText contained start="."  end="$"

hi jnChemEqNoteType guifg='#c778dd' gui=bold
hi jnChemEqText     guifg='#989251'

" Chem compound note type
"----------------------------------------------------------------------------------
syn keyword jnChemCompoundNoteType @chem_compound nextgroup=jnChemCompound skipwhite
syn region  jnChemCompound contained 
      \ start="." end="$"    
      \ nextgroup=jnChemCompoundDetails skipwhite skipnl skipempty
syn region  jnChemCompoundDetails contained 
      \ start="." end="^--$" 
      \ contains=jnItalic,jnBold,jnBullet,jnTextDecorator

hi jnChemCompoundNoteType guifg='#c778dd' gui=bold
hi jnChemCompound         guifg='#c4bb65'
hi jnChemCompoundDetails  guifg='#00ab9e'

" @match note type
"----------------------------------------------------------------------------------
syn region jnMatchNoteType
      \ start="^@match\n" end="^--$"
      \ contains=jnMatchingRowLHS, jnMatchingRowRHS 
      \ skipwhite 

syn region jnMatchingRowLHS contained 
      \ start="^[^@-]" end="\ze="    
      \ contains=jnItalic,jnBold,jnTextDecorator 
      \ nextgroup=jnMatchingEquals skipwhite

syn region jnMatchingRowRHS contained 
      \ start="=" end="$"    
      \ contains=jnItalic,jnBold,jnTextDecorator 
      \ skipwhite

hi jnMatchNoteType  guifg='#c778dd'
hi jnMatchingRowLHS guifg='#c4bb65'
hi jnMatchingRowRHS guifg='#00ab9e'

" FIB note type
"----------------------------------------------------------------------------------
syn keyword jnFIBNoteType @fib nextgroup=jnFIBText skipwhite
syn region  jnFIBText contained start="."  end="$" contains=jnItalic,jnBold,jnTextDecorator

hi jnFIBNoteType    guifg='#c778dd' gui=bold
hi jnFIBText        guifg='#989251'

" True false 'false' note type
"----------------------------------------------------------------------------------
syn keyword jnTFFalseNoteType @false nextgroup=jnTFFalseStatement skipwhite
syn region jnTFFalseStatement contained 
      \ start="." end="$"    
      \ contains=jnItalic,jnBold,jnTextDecorator 
      \ nextgroup=jnTFCorrectedStatement skipwhite skipnl skipempty
syn region jnTFCorrectedStatement contained 
      \ start="." end="^--$" 
      \ contains=jnItalic,jnBold,jnTextDecorator

hi jnTFFalseNoteType       guifg='#c778dd' gui=bold
hi jnTFFalseStatement      guifg='#bd2900'
hi jnTFCorrectedStatement  guifg='#63a802'

" True false 'true' note type
"----------------------------------------------------------------------------------
syn keyword jnTFTrueNoteType @true nextgroup=jnTFTrueStatement skipwhite
syn region jnTFTrueStatement contained
      \ start="." end="$"
      \ contains=jnItalic,jnBold,jnTextDecorator

hi jnTFTrueNoteType  guifg='#c778dd' gui=bold
hi jnTFTrueStatement guifg='#63a802'

" Multiple choice note type
"----------------------------------------------------------------------------------
syn keyword jnChoiceNoteType @choice nextgroup=jnChoiceStatement skipwhite

syn region jnChoiceStatement contained 
      \ start="." end="$"    
      \ contains=jnItalic,jnBold,jnTextDecorator 
      \ nextgroup=jnChoiceOptions skipwhite skipnl skipempty

syn region jnChoiceOptions contained 
      \ start="." end="^--$" 
      \ contains=jnItalic,jnBold,jnBullet,jnTextDecorator,jnRightChoice

syn match jnRightChoice '\$\s*$' contained

hi jnChoiceNoteType        guifg='#c778dd' gui=bold
hi jnChoiceStatement       guifg='#00d6d3'
hi jnChoiceOptions         guifg='#c2c4c4'
hi jnRightChoice           guifg='Red'

" @choice_group note type
"----------------------------------------------------------------------------------
syn region jnChoiceGroupNoteType
      \ start="^@choice_group " end="^--$"
      \ contains=jnChoiceGrpLHS, jnChoiceGrpRHS
      \ skipwhite 

syn region jnChoiceGrpLHS contained 
      \ start="^[^@-]" end="\ze="    
      \ contains=jnItalic,jnBold,jnTextDecorator 
      \ nextgroup=jnMatchingEquals skipwhite

syn region jnChoiceGrpRHS contained 
      \ start="=" end="$"    
      \ contains=jnItalic,jnBold,jnTextDecorator 
      \ skipwhite

hi jnChoiceGroupNoteType guifg='#c778dd'
hi jnChoiceGrpLHS        guifg='#c9906d'
hi jnChoiceGrpRHS        guifg='#6dc98c'

" As-is block
"----------------------------------------------------------------------------------
syn region jnAsIsBlock start='^@as-is' end='^--$'

hi jnAsIsBlock guifg='#a4a5a6'

" METANOTE and here lines
"----------------------------------------------------------------------------------
syn match jnMetanoteStart '^//\s*METANOTE START$'
syn match jnMetanoteEnd   '^//\s*METANOTE END'
syn match jnHereBookmark  '^//\s*here'

hi jnMetanoteStart guifg='#000000' guibg='Yellow'
hi jnMetanoteEnd   guifg='#000000' guibg='Yellow'
hi jnHereBookmark  guifg='#ffffff' guibg='Green'

"----------------------------------------------------------------------------------
" Italic, Bold, Bullets regions
"----------------------------------------------------------------------------------
syn region jnItalic contained start='_'    end='_' 
syn region jnBold   contained start='\*\*' end='\*\*'
syn match  jnBullet contained '^\*\s'
syn match  jnBullet contained '^\s\+\*\s'
syn match  jnBullet contained '^-\s'
syn match  jnBullet contained '^\s\+-\s'
syn match  jnBullet contained '^\d\+\.\s'

hi jnItalic guifg=LightBlue gui=italic
hi jnBold   guifg=LightBlue gui=bold
hi jnBullet guifg=Red gui=bold

" Text {{...}} decorators
"----------------------------------------------------------------------------------
syn match   jnTextDecoratorBoundary '{{' contained
syn match   jnTextDecoratorBoundary '}}' contained
syn region  jnTextDecorator contained matchgroup=jnTextDecoratorBoundary start='{{' end='}}\s' end='}}$' contains=jnTextDecoratorCommands
syn keyword jnTextDecoratorCommands @chem @ichem @math @imath @blue @red @green @table @th @td

hi jnTextDecoratorBoundary  guifg='DarkRed'
hi jnTextDecorator          guifg='#a5a5a7'
hi jnTextDecoratorCommands  guifg='Green' gui=bold

let b:current_syntax = "jn-ocr"
