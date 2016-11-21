syntax match xTab0 /^\t/ nextgroup=xTab1 containedin=ALL
syntax match xTab1 /\t/  contained nextgroup=xTab2
syntax match xTab2 /\t/  contained nextgroup=xTab3
syntax match xTab3 /\t/  contained nextgroup=xTab4
syntax match xTab4 /\t/  contained nextgroup=xTab1

syntax match sTab0 /^    / nextgroup=sTab1 containedin=ALL
syntax match sTab1 /    /  contained nextgroup=sTab2
syntax match sTab2 /    /  contained nextgroup=sTab3
syntax match sTab3 /    /  contained nextgroup=sTab4
syntax match sTab4 /    /  contained nextgroup=sTab1

if &background == 'dark'
	highlight xTab0 guibg=#404040 ctermbg=Grey
	highlight xTab1 guibg=#400040 ctermbg=DarkRed
	highlight xTab2 guibg=#404020 ctermbg=DarkGreen
	highlight xTab3 guibg=#004040 ctermbg=DarkBlue
else
	highlight xTab0 guibg=#cccccc ctermbg=White
	highlight xTab1 guibg=#eeaaaa ctermbg=Red
	highlight xTab2 guibg=#aaeeaa ctermbg=Green
	highlight xTab3 guibg=#8888ff ctermbg=Blue
endif
highlight link xTab4 xTab0
highlight link sTab0 xTab0
highlight link sTab1 xTab1
highlight link sTab2 xTab2
highlight link sTab3 xTab3
highlight link sTab4 xTab4
