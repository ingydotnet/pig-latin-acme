use lib 'lib';
use feature 'say';
use Pig::Latin;

say Pig::Latin->new(buffer => 'Pig stratin')->convert;
say Pig::Latin->new(buffer => 'I Like Apples')->convert;
