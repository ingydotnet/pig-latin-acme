use lib 'lib';
use feature 'say';
use Pig::Latin;

say Pig::Latin->new(english => 'Pig stratin')->convert;
say Pig::Latin->new(english => 'I Like Apples')->convert;
