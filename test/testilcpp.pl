#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';

use lib '../lib';

use Pig::LatinILCPP;

say Pig::LatinILCPP->new('Pig stratin')->convert;
say Pig::LatinILCPP->new('I LIke Apples')->convert;
