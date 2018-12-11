" Vim autoload file
" Language:     Bash with bash-oo-framework
" Maintainer:   Cj-bc <cj.bc-sd@outlook.jp>
" Last Change:  Dec 10 2018
" Version:      0.0.1
" URL:          https://github.com/Cj-bc/bashInfinity.vim
"
" This plugin do:
"   * define function for omnifunc

" ========== init =========={{{1
let s:save_cpo = &cpo
set cpo&vim

if exists("g:loaded_bashinfinity")
  finish
endif
let g:loaded_bashinfinity = 1
" }}}

" ========== VARIABLES CONFIGURATION ========== {{{1
let s:bashinfinityVim_path = expand('<sfile>:p:h') . '/..'
" path to dictionary file
let s:DICTIONARY_PATH = s:bashinfinityVim_path . '/dictionary/bashinfinity.vim'
" keywords defined in Dictionary
let s:keywords = readfile(s:DICTIONARY_PATH)

" standard libraries
let s:standard_libraries = [ 'Array/Contains',
                           \ 'Array/Intersect',
                           \ 'Array/List',
                           \ 'Array/Reverse',
                           \ 'String/GetSpaces',
                           \ 'String/IsNumber',
                           \ 'String/SanitizeForVariable',
                           \ 'String/SlashReplacement',
                           \ 'String/UUID',
                           \ 'TypePrimitives/boolean',
                           \ 'TypePrimitives/float',
                           \ 'TypePrimitives/integer',
                           \ 'TypePrimitives/map',
                           \ 'TypePrimitives/string',
                           \ 'UI/Color',
                           \ 'UI/Color.var',
                           \ 'UI/Console',
                           \ 'UI/Cursor',
                           \ 'util/bash4',
                           \ 'util/class',
                           \ 'util/command',
                           \ 'util/exception',
                           \ 'util/log',
                           \ 'util/namedParameters',
                           \ 'util/pipe',
                           \ 'util/test',
                           \ 'util/tryCatch',
                           \ 'util/type',
                           \ 'util/variable'
                          \]

" }}}

" ========== utility functions =========== {{{1

" get defined class names in the file
" @param <string:file> file path
" @return <list:class_names> detected class names
function bashinfinity#get_class_names(file)
  let s:classes = []
  for line in readfile(a:file)
    if line =~ '^class:*'
      call add(s:classes, matchstr(line, 'class:\zs.*\ze() *{*'))
    endif
  endfor
  return s:classes
endfunction
" omni func {{{1
" reffer to `:h E839`
function! bashinfinity#Bashinfinity_omni_func(findstart, base)

  let line = getline('.')
  if a:findstart
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '\a'
      let start -= 1
    endwhile
    return start
  else
    if line =~ '^import *'
      " complete standard library names
      " TODO: offer blib libraries
      for lib in s:standard_libraries
        if lib =~ '^' . a:base
          call complete_add(lib)
        endif
        if complete_check()
          break
        endif
      endfor
      return []
    else
      " complete common keywords & class names
      let s:class_names = bashinfinity#get_class_names(expand('%'))
      for word in s:keywords + s:class_names
        if word =~ '^' . a:base
          call complete_add(word)
        endif
        if complete_check()
          break
        endif
      endfor
    endif

  endif
endfunction
" }}}

" finally {{{1
let &cpo = s:save_cpo
" }}}
