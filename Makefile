.PHONY: test
test: lib/Pig/Latin.js
	@echo '---'
	perl test/test.pl
	@echo '---'
	ruby test/test.rb
	@echo '---'
	coffee test/test.coffee
	@echo '---'
	node test/test.js

lib/Pig/Latin.js: lib/Pig/Latin.coffee
	@coffee --compile $< > $@
