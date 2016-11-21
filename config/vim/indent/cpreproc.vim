setlocal comments=sr:/*,mb:*,el:*/,://
setlocal formatoptions=croqb
setlocal textwidth=80

inoreab Pdee #ifdef<CR>#else<CR>#endif<Esc>kkA
inoreab Pnee #ifndef<CR>#else<CR>#endif<Esc>kkA
inoreab Pde #ifdef<CR>#endif<Esc>kA
inoreab Pne #ifndef<CR>#endif<Esc>kA
inoreab Pddede #ifdef<CR># define <CR>#else<CR># define <CR>#endif<Esc>4kA
inoreab Pndede #ifndef<CR># define <CR>#else<CR># define <CR>#endif<Esc>4kA
inoreab Pidede #if<CR># define <CR>#else<CR># define <CR>#endif<Esc>4kA
inoreab PIdede #if !<CR># define <CR>#else<CR># define <CR>#endif<Esc>4kA
inoreab Pdde #ifdef<CR># define <CR>#endif<Esc>kkA
inoreab Pdue #ifdef<CR>#undef <CR>#endif<Esc>kkA
inoreab Pnde #ifndef<CR># define <CR>#endif<Esc>kkA
inoreab Pnue #ifndef<CR>#undef <CR>#endif<Esc>kkA
inoreab Pide #if<CR># define <CR>#endif<Esc>kkA
inoreab PIde #if !<CR># define <CR>#endif<Esc>kkA
inoreab Piue #if<CR>#undef <CR>#endif<Esc>kkA
inoreab PIue #if !<CR>#undef <CR>#endif<Esc>kkA
inoreab Pde #ifdef<CR>#endif<Esc>kA
inoreab Pne #ifndef<CR>#endif<Esc>kA
inoreab Pie #if<CR>#endif<Esc>kA
inoreab PIe #if !<CR>#endif<Esc>kA
inoreab Pfde #ifndef <C-R>=substitute(expand("%:t"), '\.', '_', 'g')<CR>__<CR># define <C-R>=substitute(expand("%:t"), '\.', '_', 'g')<CR>__<CR><CR>#endif<Esc>kO
inoreab Pfie #ifndef<CR># include ""<CR>#endif<Esc>kkA
inoreab PfIe #ifndef<CR># include <><CR>#endif<Esc>kkA
