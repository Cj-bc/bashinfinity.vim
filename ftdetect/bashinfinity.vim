" Vim filetype plugin
" Language:     Bash with bash-oo-framework
" Maintainer:   Cj-bc <cj.bc-sd@outlook.jp>
" Last Change:  Dec 13 2018
" Version:      0.0.1
" URL:                          https://github.com/Cj-bc/bashInfinity.vim


function! s:isInfinity()
  for i in range(1, line('$'))
    if !empty(matchstr(getline(i), 'source .*oo-bootstrap\.sh')) || !empty(matchstr(expand('%'), '.oo.sh'))
      return 1
    endif
  endfor
  return 0
endfunction

function! s:setFileType()
  set filetype=sh
  if s:isInfinity()
    set filetype=bashinfinity
  endif
endfunction

augroup filetypedetect
  au! BufNewFile,BufRead *.sh,*.bash call s:setFileType()
augroup END
