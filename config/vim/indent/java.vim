" Vim indent file
" Language:	Java
" Maintainer:	Zbynek Vyskovsky (kvr@centrum.cz)
" Last Change:	2011-04-13

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
	finish
endif
let b:did_indent = 1

" C indenting is built-in, thus this is very simple
setlocal autoindent
setlocal cindent
setlocal cinkeys='0{,0},:,!^F,o,O,e,#
setlocal cinoptions=j10g0:0
setlocal sw=8
setlocal smarttab
setlocal cindent

setlocal comments=sr:/*,mb:*,el:*/,://

setlocal formatoptions=croqb
