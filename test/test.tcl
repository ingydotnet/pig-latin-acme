lappend ::auto_path lib
package require Pig::Latin

puts [[Pig::Latin new "Pig latin"] convert]
puts [[Pig::Latin new "Stringy thingy"] convert]
puts [[Pig::Latin new "I Like Apples"] convert]
