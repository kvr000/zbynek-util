" Vim plugin for editing gpg-ed files.
" Maintainer: Zbynek Vyskovsky (kvr@centrum.cz)
" Last Change: 2003-09-08

" Exit quickly when:
" - this plugin was already loaded
" - when 'compatible' is set
" - some autocommands are already taking care of compressed files
if exists("loaded_gpg") || &cp || exists("#BufReadPre#*.gpg")
	finish
endif
let loaded_gpg = 1
let s:mypath=expand("<sfile>:p:h")."/"

augroup gpg
	" Remove all gpg autocommands
	au!

	autocmd BufReadPre,FileReadPre	*.gpg	setlocal bin
	autocmd BufReadPost		*.gpg	call s:uncompress(s:mypath."gpgphe -d") | call s:subau("BufReadPost", expand("<afile>"))
	autocmd FileReadPost		*.gpg	call s:uncompress(s:mypath."gpgphe -d") | call s:subau("FileReadPost", expand("<afile>"))
	autocmd BufWritePre		*.gpg	call s:subau("BufWritePre", expand("<afile>")) | call s:compress(s:mypath."gpgphe -e")
	autocmd FileWritePre		*.gpg	call s:subau("FileWritePre", expand("<afile>")) | call s:compress(s:mypath."gpgphe -e")
	autocmd BufWritePost		*.gpg	call s:undocmp(s:mypath."gpgphe -d") | call s:subau("BufWritePost", expand("<afile>"))
	autocmd FileWritePost		*.gpg	call s:undocmp(s:mypath."gpgphe -d") | call s:subau("FileWritePost", expand("<afile>"))
	"  autocmd FileAppendPre	*.gpg   call s:appre("gpgphe --decrypt-files")
	"  autocmd FileAppendPost	*.gpg   call s:write("gpgphe --encrypt-files")
augroup END

fun s:subau(ev, fn)
	if (exists("#".a:ev."#*.".fnamemodify(a:fn, ":r:e")))
		"echom "executing ".a:ev." for ".fnamemodify(a:fn, ":r:e")
		execute "doau ".a:ev." ".fnamemodify(a:fn, ":r")
	endif
endfun

fun s:uncompress(cmd)
	if !exists("$PGPASSPH")
		let $PGPASSPH=inputsecret("Passphrase (if needed): ")
	endif
	let ma=&modifiable
	set ma
	execute "silent '[,']!".a:cmd
	let &modifiable=ma
endfun

fun s:compress(cmd)
	if !exists("$PGRCPT")
		let $PGRCPT=input("Recepient: ")
	endif
	let ma=&modifiable
	set ma
	execute "silent '[,']!".a:cmd
	let &modifiable=ma
endfun

fun s:undocmp(cmd)
	call s:uncompress(a:cmd)
endfun

" vim: set sw=8 :
