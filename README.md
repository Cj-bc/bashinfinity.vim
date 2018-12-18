日本語: [JA_README.md](JA_README.md)

---

# bashinfinity.vim

**Vim Plugin for bash-oo-framework**

# description

This is a vim plugin for bash framework 'bash-oo-framework'

  - [niieani/bash-oo-framework](https://github.com/niieani/bash-oo-framework)

# features

  - omnifunc
  - syntax highlight
  - dictonary

# omnifunc

The *omnifunc* provides some completion by function.
Can be invoked by `<C-x><C-o>` in insert mode.

This provide some omnifunctions
contains:

  - [x] Standard library completion
  - [x] Suggest library names after 'import'
  - [ ] Blib library completion
  - [ ] completion after handlers `var: `/`$var:`
    - [x] variable name to use handler
    - [x] class method
    - [x] instance method
    - [x] properties
    - [ ] primitive type's methods
  - [ ] Class completion
    - [x] Class name
    - [x] Class method
    - [x] Instance method
  - [ ] Do for imported files


# dictionary

The *Dictionary* let you complete some words in Dictionary.
Can be invoked by `<C-x><C-k>` in insert mode.

# syntax highlight

Offers suitable colors for bash-oo-framework statement

  - Import: `import`
  - Log: `Log`
  - Exceptions: `try`/`catch`/`throw`
  - types: `namespace`/`integer`/boolean`/`string`/`array`/`map`
  - variable definitions: `[string]`/`[array]`/`[integer]`/`[map]`/`[boolean]`
  - scopes: `private`/`public`
  - classes: `class:`/class method/instance method
