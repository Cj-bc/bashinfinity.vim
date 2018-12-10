" Vim ftplugin file
" Language:     Bash with bash-oo-framework
" Maintainer:   Cj-bc <cj.bc-sd@outlook.jp>
" Last Change:  Dec 07 2018
" Version:      0.0.1
" URL:          https://github.com/Cj-bc/bashInfinity.vim
"
" This plugin do:
"   * set dictionary for bash-oo-framework
"   * set omni function

exec "setlocal dictionary=" . expand('<sfile>:p:h') . "/../dictionary/bashinfinity.vim"
setlocal omnifunc=bashinfinity#Bashinfinity_omni_func

"  at the last
let &cpo = s:save_cpo
unlet s:save_cpo
