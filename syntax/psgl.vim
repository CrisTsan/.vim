" Vim syntax file
" Language: pseudoglossa
" Maintainer: Christos Tsanikidis
" Version: 0.02 Beta

if exists("b:current_syntax")
  finish
endif

syn match vars '([a-zα-ω]\|[A-ZΑ-Ω)\+[a-zα-ω0-9_]*'
syn match vars '([a-zα-ω]\|[A-ZΑ-Ω)\+[A-Z-Α-Ωa-zα-ω0-9_]*'

" Operators
syn keyword operators ΚΑΙ Η ΟΧΙ mod div
syn match operators "+\|*\|/\|-\|<[=]\|>[=]\|<>"
" Assignment
syn match assignment "<-"
" Keywords
syn keyword basic ΤΕΛΟΣ_ΕΠΑΝΑΛΗΨΗΣ ΟΣΟ ΓΙΑ ΔΙΑΒΑΣΕ ΕΠΑΝΑΛΑΒΕ ΜΕΧΡΙΣ_ΟΤΟΥ ΔΕΔΟΜΕΝΑ ΕΚΤΥΠΩΣΕ ΑΠΟΤΕΛΕΣΜΑΤΑ ΑΝ ΑΛΛΙΩΣ ΑΛΛΙΩΣ_ΑΝ ΤΕΛΟΣ_ΑΝ ΑΠΟ ΜΕΧΡΙ ΜΕ_ΒΗΜΑ ΑΝΤΙΜΕΤΑΘΕΣΕ ΚΑΘΑΡΙΣΕ ΚΑΛΕΣΕ ΕΜΦΑΝΙΣΕ ΓΡΑΨΕ ΤΟΤΕ

" Starting Keyword Followed by Name of Program

" Comments & TODO 
syn match comments "!.*$" contains=todo
syn keyword todo contained TODO FIXME XXX NOTE ΔΙΟΡΘΩΣΗ ΝΑ_ΦΤΙΑΞΩ 

" String Literal
syn region strng start='"' end='"'

" Expression 

syn match maths '\d\+'
syn match maths '\d\+\.\d*'

syn match maths '\d\-'
syn match maths '\d\-\.\d*'

syn match maths '\d[[:digit:]]*[eE][\-+]\=\d\+'
syn match maths '\d[[:digit:]]*[eE][\-+]\=\d\+'

syn match maths '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'
syn match maths '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'

syn keyword titl ΑΛΓΟΡΙΘΜΟΣ ΤΕΛΟΣ nextgroup=title_str skipwhite


"**************************************************************
"**************************************************************

let b:current_syntax = "psgl"

hi def link basic Statement
hi def link titl Statement
hi def link assignment Special

hi def link comments Comment
hi def link todo Todo

hi def link strng PreProc
hi def link maths Constant
hi def link operators Constant
hi def link vars Type
