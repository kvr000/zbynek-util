" Vim indent file
" Language:	C
" Maintainer:	Zbynek Vyskovsky (kvr@centrum.cz)
" Last Change:	2004-09-29

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
	finish
endif
let b:did_indent = 1

source <sfile>:h/clike.vim

setlocal comments=sr:/*,mb:*,el:*/,://

if exists("ckeywordprgfv")
	let &l:keywordprg=ckeywordprgfv
endif
if exists("cincludedirs")
	let &l:path=cincludedirs
endif

cnoreab Cman !<C-R>=ckeywordprgfv<CR>

source <sfile>:h/cpreproc.vim
