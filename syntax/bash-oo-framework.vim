" Vim syntax file
" Language:		Bash with bash-oo-framework
" Last Change:		Oct 18 2018
" Version:		0.0.1
" For options and settings, please use:      :help ft-sh-syntax

" quit when a syntax file was already loaded {{{1
if exists('b:current_syntax')
  finish
endif

" include default sh syntax file
runtime syntax/sh.vim


" keywords {{{1
syn keyword bashooImport import
syn keyword bashooLog namespace Log
syn keyword bashooTry try nextgroup=bashooTryReg
syn keyword bashooCatch catch nextgroup=bashooCatchReg
syn keyword bashooException throw
syn keyword bashooNamedParam "\[string\]" "\[array\]" "\[integer\]" "\[map\]" "[boolean]"
syn keyword bashooType string array integer map boolean

" match {{{1
syn match bashooClassDefinition 'class:[^(]*()'
syn match bashooClassMethod '[^:]*::[^(]*'
syn match bashooObjectmethod '.*\.[^(]*'
syn match bashooNamespace 'namespace *'

" region {{{1
syn region bashooTryReg start=/{/ms=e+1 end=/}/me=s-1 contains=ALL
syn region bashooCatchReg start=/{/ms=e+1 end=/}/me=s-1 contains=ALL
syn region bashooClassReg start=/{/ms=e+1 end=/}/me=s-1 contains=bashooClassMethod,bashooClassDefinition,bashooStrageClass,bashooObjectmethod
"syn region bashoo 'namespace *'

hi def link bashooImport Include
hi def link bashooLog Statement
hi def link bashooTry Exception
hi def link bashooCatch Exception
hi def link bashooException Exception
hi def link bashooNamedParam Type
hi def link bashooType Type
hi def link bashooStrageClass StrageClass
hi def link bashooClassMethod Function
hi def link bashooClassDefinition Function
hi def link bashooObjectmethod Function
" vim: ts=16 fdm=marker
