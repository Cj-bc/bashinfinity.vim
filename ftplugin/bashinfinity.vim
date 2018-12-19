" Vim ftplugin file
" Language:     Bash with bash-oo-framework
" Maintainer:   Cj-bc <cj.bc-sd@outlook.jp>
" Last Change:  Dec 19 2018
" Version:      0.1.0
" URL:          https://github.com/Cj-bc/bashInfinity.vim
"
" This plugin do:
"   * set dictionary for bash-oo-framework
"   * set omni function

exec "setlocal dictionary=" . expand('<sfile>:p:h') . "/../dictionary/bashinfinity.vim"
setlocal omnifunc=bashinfinity#Bashinfinity_omni_func
