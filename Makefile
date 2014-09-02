.PHONY: doc test

default: help

help:
	@echo ''
	@echo 'Makefile targets:'
	@echo ''
	@echo '    test    - Run tests'
	@echo '    update  - Update stuff'
	@echo '    clean   - Clean up build files'
	@echo ''

test: lib/Pig/Latin.js
	@echo -n '>>> '
	perl test/test.pl
	@echo
	@echo -n '>>> '
	ruby test/test.rb
	@echo
	@echo -n '>>> '
	coffee test/test.coffee
	@echo
	@echo -n '>>> '
	node test/test.js
	@echo
	@echo -n '>>> '
	python test/test.py

lib/Pig/Latin.js: lib/Pig/Latin.coffee
	@coffee --compile $< > $@

update: doc

doc:
	swim --to=pod --wrap=1 doc/Pig/Latin.swim > ReadMe.pod

clean purge:
	find . -name *.pyc | xargs rm
