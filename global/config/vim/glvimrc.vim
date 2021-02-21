" " " glvimrc.vim - ViM global init file
" " " Written by Zbynek Vyskovsky
" " " (rat@atrey.karlin.mff.cuni.cz, http://atrey.karlin.mff.cuni.cz/~rat)
" " " Last update: 2000-05-13

" " " *0-section*
" " " This file is called by local-init file, in which should be set some
" " " variables:
" " "  *localrcfile* - local-init-file, this is called from this script
" " "  *frfile* - autocmd file
" " "  *hlfile* - highlight file
" " "  *guiwinshell* - shell command that runs command in new window
" " "  *cincludedirs* - c-include directories (used in |frfile|) for C-programs
" " "  *keywordprgval* - value of keywordprg
" " "  *ckeywordprgval* - value of keywordprg (for C-programs)
" " "  *sfttimezone* - string that is given to strftime
" " "  *email* - email
" " "  *www* - Home Page
" " "  *usegzautocmd* - which gzip-autocommands create
" " "  *viminfodef* - default for viminfo, the same format as |'viminfo'| option
" " "  *guifontval*, *guicolsval*, *guilinesval* - gui-font, columns and lines
" " " There can be also read first section of *extended-curdir-vimrc* (script
" " " that should be read in this |0-section| and in |9-section|).
" " " In this file are set default options, then is called *x-section* 
" " " (variable localrcst == "x") of |localrcfile| (there can be set local
" " " options), then are created mappings and abbreviations, then is called
" " " *9-section* (localrcst == "9") of |localrcfile| (there should be local
" " " mappings, abbreviations, set national-keyboard-support and there can be
" " " read *curdir-vimrc* (or *extended-curdir-vimrc* if exists), set |lviminfo|
" " " variable), then is set viminfo option (see part |lviminfo|)

" set no compatibility
if &cp
	set nocp
endif

" " " runtime information
let &runtimepath = expand("<sfile>:h").",".&runtimepath

" " " *options*
" " general options
" don't autowrite files
set noautowrite
" create backup only temporary
set nobackup
set writebackup
" copy file instead of renaming it
set backupcopy=yes
" be able to use undo on previous files (important for :make)
set hidden
" set icon to the name of current file
set icon
" use recursive mappings
set remap
" long time for map keys
" short time for Escape-sequences, because Escape is most used key in vi
set timeout
set timeoutlen=3000
set ttimeoutlen=300
" give 'use ! to overwrite' message
set nowriteany
" set normal slash, even on windos-like systems
set shellslash
" encoding
set fileencodings=utf-8
set encoding=utf-8
set swapfile
" remove current directory from swap file list
set directory-=.


" " editor options
" delete only newlines
set backspace=1
" use only Ctrl-K for entering digraphs
set nodigraph
" set noedcompatible
set noedcompatible
" set equalprg to empty string (use C-indenting)
set equalprg=
" use errorbless only for errors without messages
set noerrorbells
" use internal formatting
set formatprg=
" don't set g-subst-flag by default
set nogdefault
" don't highlight all matches
set hlsearch
" don't ignore case in search patterns
set noignorecase
" don't show match while typing pattern
set noincsearch
" don't start in insertmode
set noinsertmode
" use only one space, when joining lines
set nojoinspaces
" use magic search patterns
set magic
" match (), [], {} and <>
set matchpairs=(:),[:],{:},<:>
" don't show occurence of completed tag
set noshowfulltag
" search what I typed
set nosmartcase
" move-command and ^ is faster than move-command and next complicated move-commands
set nostartofline
" use vi-compatible ~-command
set notildeop
" important for scripts using /.../ command
set nowrapscan

" " screen options
" set cmdheight to 1
set cmdheight=1
if has("mouse")
	" enable mouse in all modes
	set mouse=ar
endif
" I don't like setting win-heights after every opening or closing window
set noequalalways
" status line only if there are at least two windows
set laststatus=1
" redraw screen while executing macros, ...
set nolazyredraw
" wrap at all characters
set nolinebreak
" show Tabs as spaces
set nolist
" don't print line-numbers
set nonumber
" I have Ctrl-G or gCtrl-G
set noruler
" scroll only one line
set scrolljump=1
" allow cursor to be at the top and bottom
set scrolloff=0
" shortmess: use [noeol], [+], [New], [RO], short file-format
set shortmess=imnrx
" don't show break of line
set showbreak=
" don't show command
set noshowcmd
" don't show matching bracket
set noshowmatch
" I know if I am in Normal, Visual or Insert mode
set noshowmode
" when splitting window, put the new window above the current one
set nosplitbelow
" horizontal scroll set to half a screen
set sidescroll=0
" set window title
set title
" set old title to env XTITLE (if exists)
if exists("$XTITLE")
	let &titleold=$XTITLE
endif
" search first in external termcaps
set nottybuiltin
" use beep instead of screen flash
set novisualbell
" warn when a shell command is used and buffer has been changed
set warn

" " default file options
" auto-indent is needed by most of files
set autoindent
" shiftround not good for labels, case, ...
set noshiftround
" tab of size 'shiftwidth' used by most of files
set smarttab
" don't use line-breaking by default
set textwidth=0
set wrapmargin=0
" don't wrap long lines
set nowrap
set modeline

" use bash completion
set wildmode=longest,list

if exists("keywordprgval")
	let &keywordprg=keywordprgval
else
	let keywordprgval=&keywordprg
endif
if !exists("ckeywordprgval")
	let ckeywordprgval=keywordprgval
endif

" " gui options
if has("gui_running")
	" wait for y command to insert text into clipboard
	let &guioptions=substitute(&guioptions, '[amT]', '', 'g')
	if argc() > 0
		let &guioptions=&guioptions."f"
	endif
	if exists("guifontval")
		if has("xfontset")
			let &guifontset=guifontval
		else
			let &guifont=guifontval
		endif
	endif
	set guiheadroom=0
	if exists("guicolsval")
		let &columns=guicolsval
	endif
	if exists("guilinesval")
		let &lines=guilinesval
	endif
	" make keywordprg to create new window
	if exists("guiwinshell")
		if guiwinshell != ''
			let tmp1=guiwinshell.' '
		else
			let tmp1=''
		endif
	else
		let tmp1=''
	endif
	let &keywordprg=tmp1.keywordprgval
	let ckeywordprgfv=tmp1.ckeywordprgval
	unlet tmp1
else " non-gui options
	" do not restore screen when executing external commands
	if has("win32")
		set norestorescreen
	elseif has("unix")
		set t_ti= t_te=
	endif
endif


if !exists("ckeywordprgfv")
	let ckeywordprgfv=ckeywordprgval
endif

" set local options
if exists("*LIx")
	call LIx()
endif

" " " *mappings*
" " habits from other editors:
" map <F2> to save
nnoremap <F2> :w<CR>
" next window
nnoremap <F6> <C-W><C-W>
" previous window
nnoremap <S-F6> <C-W>W
" previous error
nnoremap <F7> :cp<CR>
" next error
nnoremap <F8> :cn<CR>
" make
nnoremap <F9> :make<CR>
" quit
nnoremap <F10> :qa<CR>

if has("gui_win32")
	set winaltkeys=no
endif

" " some commands do unexpected actions
" map Y to more intuitive action
nnoremap Y y$
" map S to more intuitive action
nnoremap S hs

" " window commands, <C-W><S-st> is too complicated
" use ^W^W to previous and ^Ww or ^WW to next window
nnoremap <C-W><C-W> <C-W>W
" map ^W^R to ^WR
nnoremap <C-W><C-R> <C-W>R
" [[]] remapping
noremap ]] ][
noremap ][ ]]

" " command-line editing
" move-commands
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>w <S-Right>
cnoremap <Esc>e <S-Right>
cnoremap <Esc>B <C-Left>
cnoremap <Esc>W <C-Right>
cnoremap <Esc>E <C-Right>
" edit-commands
cnoremap <C-D> <Del>
cnoremap <C-G> <C-R>=expand("<cword>")<CR>
cnoremap <C-X> <C-R>=expand("<cWORD>")<CR>
" history-commands with comparing current command line
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
" history-commands without comparing current command line
cnoremap <Esc>k <S-Up>
cnoremap <Esc>j <S-Down>
" map two escapes to exit from command-line
cnoremap <Esc><Esc> <Esc>

" " mappings for :make
" map Ctrl-P to go to previous error/warning
nnoremap <C-P> :cp<CR>
" map Ctrl-N to go to next error/warning
nnoremap <C-N> :cn<CR>

" " mappings for copy-paste from/to gui
" paste
nnoremap <Bslash>p "+p
nnoremap <Bslash>P "+P
" yank
nnoremap <Bslash>y "+y
nnoremap <Bslash>Y "+Y
vnoremap <Bslash>y "+y
vnoremap <Bslash>Y "+Y

" switch last buffers
nnoremap <Bslash>b :b#<CR>

" " miscellanious mappings
" man
nnoremap <Bslash>m :!<C-R>=&keywordprg<CR><Space>
" for `make find' command (this should find all occurrences of word in source files)
nnoremap <Bslash>f :let<Space>$word=expand("<cword>")<Bar>make find<CR>
" set value of option paste
nnoremap <Bslash>s :set<Space>paste!<Bar>set<Space>paste?<CR>
" set value of option wrap
nnoremap <Bslash>w :set<Space>wrap!<Bar>set<Space>wrap?<CR>
" wait after typing ZZ or ZQ
nnoremap ZZ :x
nnoremap ZQ :q
" use QQ to enter ex-mode. Q[^Q] is reserved for various user macros
nnoremap QQ Q
" exchange backtick with quote
noremap ' `
noremap ` '
" map <CR> to go to next page (with Ctrl-D)
nnoremap <CR> <C-D>

if version <= 503 " bug in :close (<C-W>c) command
	nnoremap <C-W>c :if<Space>&lines!=winheight(winnr())+&laststatus/2+1<Bar>q<Bar>endif
endif

" " " *abbreviations*
" " insert mode
" default value for sfttimezone
if !exists("sfttimezone")
	let sfttimezone="%Z"
endif
if !exists("email")
	let email='EmailUnknown'
endif
if !exists("www")
	let email='WWWUnknown'
endif
inoreab Ydtr <C-R>=strftime("%a, %d %b %Y %H:%M:%S %z")<CR>
inoreab Ydtz <C-R>=strftime("%Y-%m-%d %H:%M:%S %z")<CR>
inoreab Ydt0 <C-R>=strftime("%Y-%m-%d %H:%M:%S ".sfttimezone)<CR>
inoreab Ydate <C-R>=strftime("%Y-%m-%d")<CR>
inoreab Ytime <C-R>=strftime("%H:%M:%S")<CR>
inoreab Yname <C-R>=name<CR>
inoreab Yemail <C-R>=email<CR>
inoreab Ywww <C-R>=www<CR>

" " " *autocommands*
" " see `Don't inherit options' in Special-routines
au BufNewFile,BufRead *.mi set ft=mason

" set local autocommands and local main-pre-autocommand
if exists("*LIa")
	call LIa()
endif

" exec indent initialization
runtime indent.vim

function UpdateROs(first, last)
	let savedmore = &more
	let errors = ""
	set nomore
	let showbuf = bufnr("%")
	let b = a:last+1
	while b > a:first
		let b = b-1
		if !bufloaded(b)
			continue | endif
		exec "b".b
		if &ro
			continue | endif
		if strlen(bufname("%")) == 0
			continue | endif
		if !filereadable(bufname("%"))
			let errors = "Buf ".b." (".bufname("%").") cannot be read\n".errors
			let showbuf = b
			continue
		endif
		if filewritable(bufname("%"))
			continue | endif
		if &modified
			let errors = "Buf ".b." (".bufname("%").") is RO but modified\n".errors
			let showbuf = b
			continue
		endif
		let v:errmsg = ""
		edit
		if v:errmsg != ""
			let errors = "Buf ".b." (".bufname("%")."), edit: ".v:errmsg."\n".errors
		endif
	endwhile
	let &more = savedmore
	exec "b".showbuf
	if errors != ""
		echohl Error | echon errors | echohl None
		let v:errmsg = errors
	endif
endfunction

function UpdateAllROs()
	call UpdateROs(1, bufnr("$"))
endfunction

command UpdateAllROs call UpdateAllROs()

" set mappings, abbreviations, functions etc.
if exists("*LI9")
	call LI9()
endif

" " " *lviminfo*
" " viminfo-file
" name and flags are read from variable lviminfo
" not-presented flags and 'r'-flags are copied from variable |viminfodef|
" there can be \flags, at begin of lviminfo, then these flags are not copied
" if there is no n-flag in lviminfo, it's created from lvimfpr and viminfodef
" n-flag
" if lviminfo does not exists and rwdstat is greater or equal to zero and
" viminfo-file is readable, lviminfo is created
if rwdstat >= 0 && !exists("lviminfo")
	let lviminfo=lvimfpr.substitute(viminfodef, '\(^\|.\{-},\)n\(.*\)$', '\2', '')
	if filereadable(lviminfo)
		let lviminfo="n".lviminfo
	else
		unlet lviminfo
	endif
endif
if exists("lviminfo") && has("viminfo")
	let tmpnp=match(lviminfo, '^\(.*,\|\)n')
	if tmpnp == -1
		let tmpnp=strlen(lviminfo)
		if tmpnp
			let lviminfo=lviminfo.",n".lvimfpr.substitute(viminfodef, '^\(.\{-},\|\)\(n.*\)$', '\2', '')
		else
			let lviminfo="n".lvimfpr.substitute(viminfodef, '^\(.\{-},\|\)n\(.*\)$', '\2', '')
		endif
	endif
	let tmpvd=viminfodef
	let tmpvp=""
	let tmpdp=0
	let tmp1=0
	while tmpvd[0] != 'n'
		let tmpdp=match(tmpvd, ",")
		let tmp1=tmpvd[0]
		if tmpvd[0] == "/" || tmpvd[0] == "\\"
			let tmp1="\\".tmp1
		endif
		if (tmp1 == 'r' || match(",".lviminfo, ','.tmp1.'\|$') >= tmpnp) && match(lviminfo, "^\\\\[^,]*".tmp1) == -1
			let tmpvp=tmpvp.strpart(tmpvd, 0, tmpdp+1)
		endif
		let tmpvd=strpart(tmpvd, tmpdp+1, strlen(tmpvd)-tmpdp)
	endwhile
	unlet tmpdp
	unlet tmp1
	unlet tmpvd
	let &viminfo=tmpvp.substitute(lviminfo, '^\\[^,]*,', '', '')
	" do not set viminfo when running with argument
	if (!exists("viminfo_force") || viminfo_force == 0) && argc() > 0
		set viminfo=
	endif
	unlet tmpvp
	unlet tmpnp
else
	set viminfo=
endif

" " " going to run
if has("gui_running")
	hi User1 guibg=black guifg=red
	hi User2 guibg=black guifg=green
	hi User3 guibg=black guifg=blue
	hi User4 guibg=black guifg=white
	hi Normal guibg=Black guifg=#20A020
	hi Search guibg=#606060 guifg=NONE
	set titlestring=%F%r\ -\ VIM
	set background=dark
	colorscheme darkblue
	syntax on
else
	set background=dark
	syntax off
endif

if exists("*LIp")
	call LIp()
endif
