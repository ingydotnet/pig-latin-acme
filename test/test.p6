use lib 'lib';
use Pig::Latin;

say Pig::Latin.new(english => 'Pig latin').convert;
say Pig::Latin.new(english => 'Stringy thingy').convert;
say Pig::Latin.new(english => 'I Like Apples').convert;
