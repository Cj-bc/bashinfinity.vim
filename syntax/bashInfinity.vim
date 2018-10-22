" Vim syntax file
" Language:		Bash with bash-oo-framework
" Maintainer:		Cj-bc <cj.bc-sd@outlook.jp>
" Last Change:		Oct 22 2018
" Version:		0.0.1
" URL:                          https://github.com/Cj-bc/bashInfinity.vim
" For options and settings, please use:      :help ft-sh-syntax

" quit when a syntax file was already loaded {{{1
if exists('b:current_syntax')
  finish
endif

" include default sh syntax file
runtime syntax/sh.vim


" cluster {{{1
syn cluster bashinfinityClass contains=bashinfinityStorageClass,bashinfinityClassDefinition,bashinfinityClassReg
syn cluster bashinfinityMethod contains=bashinfinityMethodReg

" keywords {{{1
syn keyword bashinfinityImport import
syn keyword bashinfinityLog namespace Log
syn keyword bashinfinityTry try nextgroup=bashinfinityTryReg skipwhite
syn keyword bashinfinityCatch catch nextgroup=bashinfinityCatchReg skipwhite
syn keyword bashinfinityException throw
syn keyword bashinfinityNamedParam "\[string\]" "\[array\]" "\[integer\]" "\[map\]" "\[boolean\]"
syn keyword bashinfinityType string array integer map boolean
syn keyword bashinfinityStorageClass private public nextgroup=bashinfinityType skipwhite

" match {{{1
syn match bashinfinityClassMethod '[^:]*::[^(]*'
syn match bashinfinityClassDefinition 'class:[^(]*()' nextgroup=bashinfinityClassReg skipwhite
syn match bashinfinityObjectmethod '.*\.[^(]*'
syn match bashinfinityNamespace 'namespace *'

" region {{{1
syn region bashinfinityTryReg start=/{/ms=e+1 end=/}/me=s-1 contains=ALL
syn region bashinfinityCatchReg start=/{/ms=e+1 end=/}/me=s-1 contains=ALL
syn region bashinfinityClassReg start=/{/ms=e+1 end=/}/me=s-1 contains=bashinfinityClassMethod,bashinfinityClassDefinition,bashinfinityStrageClass,bashinfinityObjectmethod
"syn region bashinfinity 'namespace *'

hi def link bashinfinityImport Include
hi def link bashinfinityLog Statement
hi def link bashinfinityTry Exception
hi def link bashinfinityCatch Exception
hi def link bashinfinityException Exception
hi def link bashinfinityNamedParam Type
hi def link bashinfinityType Type
hi def link bashinfinityStorageClass StorageClass
hi def link bashinfinityClassMethod Function
hi def link bashinfinityClassDefinition Function
hi def link bashinfinityObjectmethod Function
"hi def link bashinfinityNamespace


" Set Current Syntax: {{{1
let b:current_syntax = 'bashinfinity'

" vim: ts=16 fdm=marker
