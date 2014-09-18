.PHONY: doc test

ALL := \
    bash \
    cpp \
    coffee \
    go \
    lingy \
    node \
    perl5 \
    perl5-inline-cpp \
    perl6 \
    php \
    python2 \
    python3 \
    racket \
    ruby \
    scala \

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

test: $(ALL_TEST) cleanup

test-bash:
	@test/run Bash 'bash test/test.bash'

test-cpp:
	@test/run C++ 'g++ -o test/test-cpp test/test.cpp && test/test-cpp'

test-coffee: clean
	@test/run CoffeeScript 'coffee test/test.coffee'

test-go:
	@test/run Go 'go run test/test.go'

test-lingy:
ifneq (,$(shell perl -e 'require YAML::XS' 2>&1))
	@echo 'XXX Perl 5 + YAML::XS module required'
else
	@echo '>>> Lingy: '
	@perl -MYAML::XS -e 'YAML::XS::LoadFile(shift)' lib/Pig/Latin.ly.yaml
	@echo Lingy Loads OK
endif
	@echo

test-node: lib/Pig/Latin.js
	@test/run Node.js 'node test/test.js'

test-perl5:
ifneq (,$(shell perl -e 'require Mo' 2>&1))
	@echo 'XXX Perl 5 + Mo module required'
	@echo
else
	@test/run 'Perl 5' 'perl test/test.pl'
endif

test-perl5-inline-cpp:
	@# Need to check for Inline::CPP
ifneq (,$(shell perl -e 'require Inline::CPP' 2>&1))
	@echo 'XXX Perl 5 + Inline::CPP module required'
	@echo
else
	@test/run 'Perl w/ Inline::CPP' 'perl test/test.inline-cpp.pl'
endif

test-perl6:
	@test/run 'Perl 6' 'perl6 test/test.p6'

test-php:
	@test/run PHP 'php test/test.php'

test-python2:
	@test/run Python 'python test/test.py'

test-python3:
	@test/run 'Python 3' 'python3 test/test.py3'

test-racket:
	@test/run Racket 'racket test/test.rkt'

test-ruby:
	@test/run Ruby 'ruby test/test.rb'

test-scala: clean
	@test/run Scala 'scalac lib/Pig/Latin.scala test/test.scala -d test/ && scala -cp test/ Pig.Test'

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

clean purge cleanup:
	@rm -fr \
	  test/test-cpp \
	  lib/Pig/Latin.js \
	  lib/**/*.pyc \
	  lib/Pig/__pycache__ \
	  _Inline test/Pig

