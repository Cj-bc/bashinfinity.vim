" Vim ftplugin file
" Language:     Bash with bash-oo-framework
" Maintainer:   Cj-bc <cj.bc-sd@outlook.jp>
" Last Change:  Dec 07 2018
" Version:      0.0.1
" URL:          https://github.com/Cj-bc/bashInfinity.vim

let s:save_cpo = &cpo
set cpo&vim

if exists("g:loaded_bashinfinity")
  finish
endif
let g:loaded_bashinfinity = 1


"  at the last
let &cpo = s:save_cpo
unlet s:save_cpo
