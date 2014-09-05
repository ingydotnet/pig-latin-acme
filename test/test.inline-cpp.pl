use strict;
use warnings;
use feature 'say';

use lib 'lib';

use Pig::LatinILCPP;

say Pig::LatinILCPP->new('Pig latin')->convert;
say Pig::LatinILCPP->new('Stringy thingy')->convert;
say Pig::LatinILCPP->new('I LIke Apples')->convert;
