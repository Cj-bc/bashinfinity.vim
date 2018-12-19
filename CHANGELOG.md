# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [version] - YYYY/MM/DD

## [0.1.0] - 2018/12/19
### Add
	* ftdetect
		* files that name is *.oo.sh
		* files that calls oo-bootstrap.sh
	* Syntax highlight
		* Import: `import`
		* Log: `Log`
		* Exceptions: `try`/`catch`/`throw`
		* Types: `namespace`/`integer`/boolean`/`string`/`array`/`map`
		* Variable definitions: `[string]`/`[array]`/`[integer]`/`[map]`/`[boolean]`
		* Scopes: `private`/`public`
		* Classes: `class:`/class method/instance method
	* Omnifunc
		* After `import`
			* Standard library names
		* After `var:`/`$var:`
			* Variable names
		* After `var: <variable_name>`/`$var:<variable_name>`
			* Class methods
			* Class properties
		* otherwhere
			* keywords in dictionary
			* variable names
	* Dictionary
		* try catch throw import namespace Log private public class: var: $var:
		* [string] [array] [integer] [map] [boolean] string array integer map boolean



vim: ft=CHANGELOG noexpandtab
