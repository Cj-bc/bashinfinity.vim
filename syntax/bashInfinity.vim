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

" include default sh syntax file {{{1
runtime syntax/sh.vim


" cluster {{{1
syn cluster bashinfinityClass contains=bashinfinityAccess,bashinfinityClassDefinition,bashinfinityClassReg,bashinfinityClassMethod,bashinfinityClassMethodReg,bashinfinityClassMethodRegOpen,bashinfinityClassMethodRegOpen
syn cluster bashinfinityMethod contains=bashinfinityClassMethodReg,bashinfinityInstanceMethodReg

" keywords {{{1
syn keyword bashinfinityImport import
syn keyword bashinfinityLog namespace Log
syn keyword bashinfinityTry try nextgroup=bashinfinityTryReg skipwhite
syn keyword bashinfinityCatch catch nextgroup=bashinfinityCatchReg skipwhite
syn keyword bashinfinityException throw
syn keyword bashinfinityNamedParam "[string]" "[array]" "[integer]" "[map]" "[boolean]"
syn keyword bashinfinityType string array integer map boolean
syn keyword bashinfinityAccess private public nextgroup=bashinfinityType skipwhite

" match {{{1
syn match bashinfinityClassMethod '[^:]*::[^(]*'
syn match bashinfinityClassDefinition 'class:[^(]*()'
syn match bashinfinityInstanceMethod '.*\.[^(]*'
syn match bashinfinityNamespace 'namespace *'

" region {{{1
syn region bashinfinityTryReg matchgroup=bashinfinityTryRegOpen start=/try\s*{/ms=e+1 matchgroup=bashinfinityDelimiterClose end=/}/me=s-1
                                \ contains=ALL nextgroup=bashinfinityTryRegClose transparent
syn region bashinfinityCatchReg matchgroup=bashinfinityCatchRegOpen start=/\s*catch\s*{/ms=e+1 matchgroup=bashinfinityDelimiterClose end=/}/me=s-1
                                \ contains=ALL nextgroup=bashinfinityCatchRegClose transparent
syn region bashinfinityInstanceMethodReg matchgroup=bashinfinityInstanceMethodRegOpen start=/[^.]*\.[^(]*()\s*{/ms=e+1 matchgroup=bashinfinityDelimiterClose end=/}/me=s-1 contains=ALLBUT,@bashinfinityClass,@bashinfinityMethod
syn region bashinfinityClassMethodReg matchgroup=bashinfinityClassMethodRegOpen start=/[^:]*::[^(]*()\s*{/ms=e+1 matchgroup=bashinfinityDelimiterClose end=/}/me=s-1 contains=ALLBUT,@bashinfinityClass,@bashinfinityMethod
syn region bashinfinityClassReg matchgroup=bashinfinityClassRegOpen start=/class:[^(]*()\s*{/ms=e+1  matchgroup=bashinfinityDelimiterClose end=/}/me=s-1 contains=ALL

" region delimiters {{{2
syn match bashinfinityTryRegOpen /try\s*{/ nextgroup=bashinfinityTryReg contains=bashinfinityTry,bashinfinityDelimiterOpen
syn match bashinfinityCatchRegOpen /catch\s*{/ nextgroup=bashinfinityCatchReg contains=bashinfinityCatch,bashinfinityDelimiterOpen
syn match bashinfinityInstanceMethodRegOpen /[^.]*\.[^(]*()\s*{/ nextgroup=bashinfinityInstanceMethodReg contains=bashinfinityInstanceMethod,bashinfinityDelimiterOpen
syn match bashinfinityClassMethodRegOpen /[^:]*::[^(]*()\s*{/ nextgroup=bashinfinityClassMethodReg contains=bashinfinityClassMethod,bashinfinityDelimiterOpen
syn match bashinfinityClassRegOpen /class:[^(]*()\s*{/ nextgroup=bashinfinityClassReg contains=bashinfinityClassDefinition,bashinfinityDelimiterOpen
syn match bashinfinityDelimiterClose /}/
syn match bashinfinityDelimiterOpen /{/


" Synchronization: {{{1
if !exists("g:sh_minlines")
 let s:sh_minlines = 200
else
 let s:sh_minlines= g:sh_minlines
endif
if !exists("g:sh_maxlines")
 let s:sh_maxlines = 2*s:sh_minlines
 if s:sh_maxlines < 25
  let s:sh_maxlines= 25
 endif
else
 let s:sh_maxlines= g:sh_maxlines
endif
exec "syn sync minlines=" . s:sh_minlines . " maxlines=" . s:sh_maxlines
syn sync match bashinfinityTrySync grouphere bashinfinityTryReg /try {/
syn sync match bashinfinityCatchSync grouphere bashinfinityCatchReg /catch\s*{/
syn sync match bashinfinityClassSync grouphere bashinfinityClassReg /class:[^(]*()\s*{/
syn sync match bashinfinityInstanceMethodSync grouphere bashinfinityInstanceMethodReg /[^.]*\.[^(]*()\s*{/
syn sync match bashinfinityClassMethodSync grouphere bashinfinityClassMethodReg /[^:]*::[^(]*()\s*{/

"syn region bashinfinity 'namespace *'


" Default Highlighting: {{{1
hi def link bashinfinityImport Include
hi def link bashinfinityLog Statement
hi def link bashinfinityTry Exception
hi def link bashinfinityCatch Exception
hi def link bashinfinityException Exception
hi def link bashinfinityNamedParam Type
hi def link bashinfinityType Type
hi def link bashinfinityAccess Statement
hi def link bashinfinityClassMethod Function
hi def link bashinfinityClassDefinition Function
hi def link bashinfinityInstanceMethod Function
hi def link bashinfinityDelimiterClose Function
hi def link bashinfinityDelimiterOpen Function
"hi def link bashinfinityNamespace

""syn region bashinfinityTest matchgroup=MCgroup start=/ab:cdef {/ms=e+1 matchgroup=MCgroupE end=/}/me=s-1 contains=bashinfinityClassMethod transparent
""syn match MCgroup /ab:cdef {/ nextgroup=bashinfinityTest
""syn match MCgroupE /}/
""hi def link bashinfinityTest Todo


" Set Current Syntax: {{{1
let b:current_syntax = 'bashinfinity'

" vim: ts=16 fdm=marker
