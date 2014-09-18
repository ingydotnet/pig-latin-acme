.PHONY: doc test

ALL := \
    bash \
    cpp \
    coffee \
    go \
    node \
    perl5 \
    perl5-inline-cpp \
    perl6 \
    php \
    python2 \
    python3 \
    ruby \
    scala \
    racket \

ALL_TEST := $(ALL:%=test-%)

default: help

help:
	@echo ''
	@echo 'Makefile targets:'
	@echo ''
	@echo '    test    - Run tests'
	@echo '    update  - Update stuff'
	@echo '    clean   - Clean up build files'
	@echo ''

test: $(ALL_TEST) clean

### Bash ###
test-bash:
ifeq (,$(shell which bash))
	@echo 'XXX No Bash available'
else
	@echo -n '>>> Bash: '
	bash test/test.bash
endif
	@echo

### C++ ###
test-cpp:
ifeq (,$(shell which g++))
	@echo 'XXX No C++ available'
else
	@echo -n '>>> C++: '
	g++ -o test/test-cpp test/test.cpp && test/test-cpp
endif
	@echo

### CoffeeScript ###
test-coffee:
ifeq (,$(shell which coffee))
	@echo 'XXX No CoffeeScript available'
else
	@echo -n '>>> CoffeeScript: '
	coffee test/test.coffee
endif
	@echo

### Go ###
test-go:
ifeq (,$(shell which go))
	@echo 'XXX No Go available'
else
	@echo -n '>>> Go: '
	go run test/test.go
endif
	@echo

### Node.js ###
test-node: lib/Pig/Latin.js
ifeq (,$(shell which node))
	@echo 'XXX No Node.js available'
else
	@echo -n '>>> Node.js: '
	node test/test.js
endif
	@echo

### Perl 5 ###
test-perl5:
ifeq (,$(shell which perl))
	@echo 'XXX No Perl available'
else
ifneq (,$(shell perl -e 'require Mo' 2>&1))
	@echo 'XXX Perl 5 Mo module required'
else
	@echo -n '>>> Perl: '
	perl test/test.pl
endif
endif
	@echo

### Perl 5 w/ Inline::CPP ###
test-perl5-inline-cpp:
	@# Need to check for Inline::CPP
ifeq (,$(shell which perl))
	@echo 'XXX No Inline::CPP Perl module available'
else
ifneq (,$(shell perl -e 'require Inline::CPP' 2>&1))
	@echo 'XXX Perl 5 Inline::CPP module required'
else
	@echo -n '>>> Perl w/ Inline::CPP: '
	perl test/test.inline-cpp.pl
endif
endif
	@echo

### Perl 6 ###
test-perl6:
ifeq (,$(shell which perl6))
	@echo 'XXX No Perl 6 available'
else
	@echo -n '>>> Perl 6: '
	perl6 test/test.p6
endif
	@echo

### PHP ###
test-php:
ifeq (,$(shell which php))
	@echo 'XXX No PHP available'
else
	@echo -n '>>> PHP: '
	php test/test.php
endif
	@echo

### Python (2) ###
test-python2:
ifeq (,$(shell which python))
	@echo 'XXX No Python available'
else
	@echo -n '>>> Python: '
	python test/test.py
endif
	@echo

### Python (3) ###
test-python3:
ifeq (,$(shell which python3))
	@echo 'XXX No Python 3 available'
else
	@echo -n '>>> Python 3: '
	python3 test/test.py3
endif
	@echo

### Racket ###
test-racket:
ifeq (,$(shell which racket))
	@echo 'XXX No Racket available'
else
	@echo -n '>>> Racket: '
	racket test/test.rkt
endif

### Ruby ###
test-ruby:
ifeq (,$(shell which ruby))
	@echo 'XXX No Ruby available'
else
	@echo -n '>>> Ruby: '
	ruby test/test.rb
endif
	@echo

### Scala ###
test-scala:
ifeq (,$(shell which scala))
	@echo 'XXX No Scala available'
else
	@echo -n '>>> Scala: '
	scalac lib/Pig/Latin.scala test/test.scala -d test/ && \
	    scala -cp test/ Pig.Test
endif
	@echo

#------------------------------------------------------------------------------
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
	@find . -name *.pyc | xargs rm
	@rm -fr test/test-cpp lib/Pig/__pycache__ _Inline test/Pig
