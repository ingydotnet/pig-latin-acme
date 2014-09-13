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
ifeq (,$(shell which perl))
	@echo 'XXX No Perl available'
else
	@echo -n '>>> Perl: '
	perl test/test.pl
endif
	@echo
ifeq (,$(shell which perl6))
	@echo 'XXX No Perl 6 available'
else
	@echo -n '>>> Perl 6: '
	perl6 test/test.p6
endif
	@echo
ifeq (,$(shell which php))
	@echo 'XXX No PHP available'
else
	@echo -n '>>> PHP: '
	php test/test.php
endif
	@echo
ifeq (,$(shell which ruby))
	@echo 'XXX No Ruby available'
else
	@echo -n '>>> Ruby: '
	ruby test/test.rb
endif
	@echo
ifeq (,$(shell which coffee))
	@echo 'XXX No CoffeeScript available'
else
	@echo -n '>>> CoffeeScript: '
	coffee test/test.coffee
endif
	@echo
ifeq (,$(shell which node))
	@echo 'XXX No Node.js available'
else
	@echo -n '>>> Node.js: '
	node test/test.js
endif
	@echo
ifeq (,$(shell which python))
	@echo 'XXX No Python available'
else
	@echo -n '>>> Python: '
	python test/test.py
endif
	@echo
ifeq (,$(shell which python3))
	@echo 'XXX No Python 3 available'
else
	@echo -n '>>> Python 3: '
	python3 test/test.py3
endif
	@echo
ifeq (,$(shell which g++))
	@echo 'XXX No C++ available'
else
	@echo -n '>>> CPP: '
	g++ -o test/test-cpp test/test.cpp
	test/test-cpp
endif
	@echo
	@# Need to check for Inline::CPP
ifeq (,$(shell which perl))
	@echo 'XXX No Inline::CPP Perl module available'
else
	@echo -n '>>> Perl w/ Inline::CPP: '
	perl test/test.inline-cpp.pl
endif
	@echo
ifeq (,$(shell which scala))
	@echo 'XXX No Scala available'
else
	@test -n '>>> Scala: '
	scalac lib/Pig/Latin.scala test/test.scala -d test/
	scala -cp test/ Pig.Test
endif
	@echo
	@make clean > /dev/null

lib/Pig/Latin.js: lib/Pig/Latin.coffee
	@coffee --compile $< > $@

build/Latin.pm: build
	./bin/lingy --to=pm lib/Pig/Latin.ly.yaml

build:
	mkdir $@

update: doc

doc:
	swim --to=pod --complete=1 --wrap=1 doc/Pig/Latin.swim > ReadMe.pod

clean purge:
	find . -name *.pyc | xargs rm
	rm -fr test/test-cpp lib/Pig/__pycache__ _Inline test/Pig
