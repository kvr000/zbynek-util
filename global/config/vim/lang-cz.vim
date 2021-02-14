" " " lang-cz.vim - ViM local script
" " " ViM configuration file
" " " Written by Zbynek Vyskovsky
" " " (rat@atrey.karlin.mff.cuni.cz, http://atrey.karlin.mff.cuni.cz/~rat)
" " " Last update: 1998-11-08

" " " there should be remapped national characters to corresponding
" " " command-characters in Normal/Visual mode
" " " now supports iso8859-2:cz, ms852:cz, ms1250:cz
" " " these strings should be given in variable keyboard

if keyboard == "iso8859-2:cz"
  if has("langmap")
    set langmap=ì@,¹#,è$,ø%,¾^,ý&,á*,í[,é],§',ú~
    map ù ;
  else
    map ì @
    map ¹ #
    map è $
    map ø %
    map ¾ ^
    map ý &
    map á *
    map í [
    map é ]
    map "á "*
    map § '
    map ú ~
    map ù ;
  endif
elseif keyboard == "utf8:cz"
	if has("langmap")
		set langmap=ě@,š#,č$,ř%,ž^,ý&,á*,í(,é),§',ú[
	endif
elseif keyboard == "ms852:cz"
  if has("langmap")
    set langmap=Ø@,ç#,$,ý%,§^,ì&, *,¡[,],õ',£~
    map  ;
  else
    map Ø @
    map ç #
    map  $
    map ý %
    map § ^
    map ì &
    map   *
    map ¡ [
    map  ]
    map "  "*
    map õ '
    map £ ~
    map  ;
  endif
elseif keyboard == "ms1250:cz"
  if has("langmap")
    set langmap=ì@,#,è$,ø%,^,ý&,á*,í[,é],§',ú~
    map ù ;
  else
    map ì @
    map  #
    map è $
    map ø %
    map  ^
    map ý &
    map á *
    map í [
    map é ]
    map "á "*
    map § '
    map ú ~
    map ù ;
  endif
endif
