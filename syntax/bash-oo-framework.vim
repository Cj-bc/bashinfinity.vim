" Vim syntax file
" Language:		Bash with bash-oo-framework
" Last Change:		Oct 18 2018
" Version:		0.0.1
" For options and settings, please use:      :help ft-sh-syntax

" quit when a syntax file was already loaded {{{1
if exists("b:current_syntax") && b:current_syntax != "bash"
  finish
endif

" include default sh syntax file
runtime syntax/sh.vim


" keywords {{{1
syn keyword ooImport import
syn keyword ooLog namespace Log
syn keyword ooTry try catch
syn keyword ooException throw
syn keyword ooNamedParam [string] [array] [integer] [map] [boolean]
syn keyword ooType string array integer map boolean

" vim: ts=16 fdm=marker
