$LOAD_PATH.unshift 'lib'
require 'Pig/Latin'

puts Pig::Latin.new('Pig stratin').convert
puts Pig::Latin.new('I Like Apples').convert
