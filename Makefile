.PHONY: test
test: lib/Pig/Latin.js
	@echo '--- Perl'
	perl test/test.pl
	@echo
	@echo '--- Ruby'
	ruby test/test.rb
	@echo
	@echo '--- CoffeeScript'
	coffee test/test.coffee
	@echo
	@echo '--- JavaScript'
	node test/test.js
	@echo
	@echo '--- Python'
	python test/test.py

lib/Pig/Latin.js: lib/Pig/Latin.coffee
	@coffee --compile $< > $@
