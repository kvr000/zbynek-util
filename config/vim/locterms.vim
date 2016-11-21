" " " locterms.vim - ViM local script
" " " ViM configuration file
" " " Written by Zbynek Vyskovsky
" " " (rat@atrey.karlin.mff.cuni.cz, http://atrey.karlin.mff.cuni.cz/~rat)
" " " Last update: 1998-10-21

" " " there should be defined terminal codes if real term
" " " isn't equal to &term

if exists("$REALTERM") && $REALTERM != &term
  if $REALTERM == 'linux'
    " colors
    set t_AB=[4%p1%dm
    set t_AF=[3%p1%dm
    set t_Co=8
    " special keys
    set <F1>=[[A
    set <F2>=[[B
    set <F3>=[[C
    set <F4>=[[D
    set <F5>=[[E
    set <F6>=[17~
    set <F7>=[18~
    set <F8>=[19~
    set <F9>=[20~
    set <F10>=[21~
    set <S-F6>=[28~
  else
  endif
endif
