" Vim plugin for editing gpg-ed files.
" Maintainer: Zbynek Vyskovsky (kvr@centrum.cz)
" Last Change: 2003-09-08

" Exit quickly when:
" - this plugin was already loaded
" - when 'compatible' is set
" - some autocommands are already taking care of compressed files
if exists("loaded_gzip") || &cp || exists("#BufReadPre#*.gzip")
	finish
endif
let loaded_gzip = 1
let s:mypath=expand("<sfile>:p:h")."/"

augroup gzip
	" Remove all gzip autocommands
	au!

	autocmd BufReadPre,FileReadPre	*.gz	setlocal bin
	autocmd BufReadPost		*.gz	call s:uncompress("gzip -d") | call s:subau("BufReadPost", expand("<afile>"))
	autocmd FileReadPost		*.gz	call s:uncompress("gzip -d") | call s:subau("FileReadPost", expand("<afile>"))
	autocmd BufWritePre		*.gz	call s:subau("BufWritePre", expand("<afile>")) | call s:compress("gzip -9")
	autocmd FileWritePre		*.gz	call s:subau("FileWritePre", expand("<afile>")) | call s:compress("gzip -9")
	autocmd BufWritePost		*.gz	call s:undocmp("gzip -d") | call s:subau("BufWritePost", expand("<afile>"))
	autocmd FileWritePost		*.gz	call s:undocmp("gzip -d") | call s:subau("FileWritePost", expand("<afile>"))
augroup END

augroup bzip2
	" Remove all bzip2 autocommands
	au!

	autocmd BufReadPre,FileReadPre	*.bz2	setlocal bin
	autocmd BufReadPost		*.bz2	call s:uncompress("bzip2 -d") | call s:subau("BufReadPost", expand("<afile>"))
	autocmd FileReadPost		*.bz2	call s:uncompress("bzip2 -d") | call s:subau("FileReadPost", expand("<afile>"))
	autocmd BufWritePre		*.bz2	call s:subau("BufWritePre", expand("<afile>")) | call s:compress("bzip2 -9")
	autocmd FileWritePre		*.bz2	call s:subau("FileWritePre", expand("<afile>")) | call s:compress("bzip2 -9")
	autocmd BufWritePost		*.bz2	call s:undocmp("bzip2 -d") | call s:subau("BufWritePost", expand("<afile>"))
	autocmd FileWritePost		*.bz2	call s:undocmp("bzip2 -d") | call s:subau("FileWritePost", expand("<afile>"))
augroup END

augroup xzip
	" Remove all xz autocommands
	au!

	autocmd BufReadPre,FileReadPre	*.xz	setlocal bin
	autocmd BufReadPost		*.xz	call s:uncompress("xz -d") | call s:subau("BufReadPost", expand("<afile>"))
	autocmd FileReadPost		*.xz	call s:uncompress("xz -d") | call s:subau("FileReadPost", expand("<afile>"))
	autocmd BufWritePre		*.xz	call s:subau("BufWritePre", expand("<afile>")) | call s:compress("xz -9")
	autocmd FileWritePre		*.xz	call s:subau("FileWritePre", expand("<afile>")) | call s:compress("xz -9")
	autocmd BufWritePost		*.xz	call s:undocmp("xz -d") | call s:subau("BufWritePost", expand("<afile>"))
	autocmd FileWritePost		*.xz	call s:undocmp("xz -d") | call s:subau("FileWritePost", expand("<afile>"))
augroup END

fun s:subau(ev, fn)
	if (exists("#".a:ev."#*.".fnamemodify(a:fn, ":r:e")))
		"echom "executing ".a:ev." for ".fnamemodify(a:fn, ":r:e")
		execute "doau ".a:ev." ".fnamemodify(a:fn, ":r")
	endif
endfun

fun s:uncompress(cmd)
	let ma=&modifiable
	set ma
	execute "silent '[,']!".a:cmd
	let &modifiable=ma
endfun

fun s:compress(cmd)
	let ma=&modifiable
	set ma
	execute "silent '[,']!".a:cmd
	let &modifiable=ma
endfun

fun s:undocmp(cmd)
	call s:uncompress(a:cmd)
endfun

