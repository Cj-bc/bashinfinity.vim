" Vim autoload file
" Language:     Bash with bash-oo-framework
" Maintainer:   Cj-bc <cj.bc-sd@outlook.jp>
" Last Change:  Dec 19 2018
" Version:      0.1.0
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

let s:primitive_types = [ 'array',
                        \ 'string',
                        \ 'integer',
                        \ 'boolean',
                        \ 'map'
                       \]

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

" regexes
let s:regex_after_import = '^import *'
let s:regex_after_variable_handler = '\$\=var: \=.* *\_$'
let s:regex_variable_hander_variableName = 'var: \=\zs.\+\ze '
let s:regex_class_prefix = 'class:'
let s:regex_open_delimiter = '{'
let s:regex_close_delimiter = '}'
let s:regex_no_comment_out = '[^#] *'
" }}}

" ========== utility functions =========== {{{1

" bashinfinitycomplete#get_class_region {{{2
" get whole code of given class
" @param <string:file> file path
" @param <string:class_name> class name
function bashinfinitycomplete#get_class_region(file, class_name)
  let s:ret_codes = []
  let s:is_inside_class = v:false
  let s:delimiter_nest = 0
  for line in readfile(a:file)
    if ! s:is_inside_class && line !~ s:regex_class_prefix . s:class_name
      continue
    endif
    let s:is_inside_class = v:true
    call add(s:ret_codes, line)
    if line =~ s:regex_open_delimiter
      let s:delimiter_nest += 1
    elseif line =~ s:regex_close_delimiter
      let s:delimiter_nest -= 1
    endif

    if s:delimiter_nest == 0
      break
    endif
  endfor
  return s:ret_codes
endfunction

" }}}

" bashinfinitycomplete#get_class_names {{{2
" get defined class names in the file
" @param <string:file> file path
" @return <list:class_names> detected class names
function bashinfinitycomplete#get_class_names(file)
  let s:classes = []
  for line in readfile(a:file)
    if line =~ '^class:*'
      call add(s:classes, {'word': matchstr(line, 'class:\zs.*\ze() *{*'), 'kind': 'f'} )
    endif
  endfor
  return s:classes
endfunction
" }}}

" bashinfinitycomplete#get_variable_names {{{2
" get defined variable names in the file
" @param <string:file> file path
" @return <list:variable_names> detected variable names
function bashinfinitycomplete#get_variable_names(file)
  let s:ret_variables = []
  for line in readfile(a:file)
    for name in s:primitive_types + bashinfinity#get_class_names(a:file)
      if line =~ '^ *' . name . ' '
        call add(s:ret_variables, {'word': matchstr(line, name . ' \zs.*\ze'), 'kind': 'v'})
      endif
    endfor
  endfor
  return s:ret_variables
endfunction
" }}}

" bashinfinitycomplete#get_class_method_names {{{2
" get all class methods for the class
" @param <string:path> file path
" @param <list:class_names> class name
" @return <list:methods_names> detected class method names
function bashinfinitycomplete#get_class_method_names(file, class_names)
  let s:ret_method_names = []
  for line in readfile(a:file)
    for name in a:class_names
      if line =~ ' *' . name . '::.*'
        call add(s:ret_method_names, { 'word': matchstr(line, name . '::.*\ze()'), 'kind': 'f'})
      endif
    endfor
  endfor
  return s:ret_method_names
endfunction
"" }}}

" bashinfinitycomplete#get_instant_method_names {{{2
" get all instance method names of given class
" @param <string:file> file path
" @param <list:class_names> class name
function bashinfinitycomplete#get_instant_method_names(file, class_names)
  let s:ret_method_names = []
  for line in readfile(a:file)
    for name in a:class_names
      if line =~ ' *' . name . '\..*'
        call add(s:ret_method_names, { 'word': matchstr(line, name . '\..*\ze()'), 'kind': 'f'})
      endif
    endfor
  endfor
  return s:ret_method_names
endfunction
" }}}

" bashinfinitycomplete#get_class_properties {{{2
" get properties of given class
" @param <string:file> file path
" @param <string:class_name> class name
" @return <list:properties> properties of <class_name>
function bashinfinitycomplete#get_class_properties(file, class_name)
  let s:ret_properites = []
  for line in bashinfinity#get_class_region(a:file, a:class_name)
    for type in s:primitive_types + bashinfinity#get_class_names(a:file)
      if line =~ s:regex_no_comment_out . type . ' .*'
        call add(s:ret_properites, {'word': matchstr(line, type . ' \zs.*\ze *'), 'kind': 'v'}) " TODO: regex `.*` should be improved
      endif
    endfor
  endfor
  return s:ret_properites
endfunction

" }}}

" }}}

" omni func {{{1
" reffer to `:h E839`
function! bashinfinitycomplete#Bashinfinity_omni_func(findstart, base)
  let s:line = getline('.')
  let s:file = expand('%')
  if a:findstart
    let start = col('.') - 1
    while start > 0 && s:line[start - 1] =~ '\a'
      let start -= 1
    endwhile
    return start
  else
    if s:line =~ s:regex_after_import
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
    elseif s:line =~ s:regex_after_variable_handler
      " complete class properties & class/instance methods
      let s:class_name = matchstr(s:line, s:regex_variable_hander_variableName)

      if s:class_name == ''
        let s:class_names = bashinfinity#get_class_names(s:file)
        let s:variable_names = bashinfinity#get_variable_names(s:file)
        for word in s:class_names
          if word =~ '^' . a:base
            call complete_add(word)
          endif
          if complete_check()
            break
          endif
        endfor
      else
        let s:class_methods = bashinfinity#get_class_method_names(s:file, [s:class_name])
        let s:instance_methods = bashinfinity#get_instant_method_names(s:file, [s:class_name])
        let s:properties = bashinfinity#get_class_properties(s:file, s:class_name)

        let s:class_methods = map(s:class_methods, { key, val -> matchstr(val,'::\zs.*') })
        let s:instance_methods = map(s:instance_methods, {key, val -> matchstr(v:val,'\.\zs.*') })
        for word in s:class_methods + s:instance_methods + s:properties
          if word =~ '^' . a:base
            call complete_add(word)
          endif
          if complete_check()
            break
          endif
        endfor
      endif
    else
      " complete common keywords & class/variable names
      " TODO:  support names in imported files. I think it's better to save the
      "       list so that we don't have to re-search for each time.
      let s:class_names = bashinfinity#get_class_names(s:file)
      let s:variable_names = bashinfinity#get_variable_names(s:file)
      let s:class_methods = bashinfinity#get_class_method_names(s:file, s:class_names)
      let s:instance_methods = bashinfinity#get_instant_method_names(s:file, s:class_names)
      for word in s:keywords + s:class_names + s:variable_names + s:class_methods + s:instance_methods
        if word =~ '^' . a:base
          call complete_add(word)
        endif
        if complete_check()
          break
        endif
      endfor
    endif
    return []
  endif
endfunction
" }}}

" finally {{{1
let &cpo = s:save_cpo
" }}}
