use strict; use warnings;
package Pig::Latin;
our $VERSION = '0.0.1';

use Moose;

has english => (is => 'ro', required => 1);

sub convert {
    my ($self) = @_;
    my @pig_latin_words = map {
        my $word = $_;
        my $lword = lc($word);
        $lword =~ /^([^aeiou]*)(.*)$/ or die 'error';
        my $ay;
        if (length($1) == 0) {
            $ay = 'way';
        }
        else {
            $ay = 'ay';
        }
        my $pword = $2 . $1 . $ay;
        if ($word =~ /^[A-Z]/) {
            $pword = uc(substr $pword, 0, 1) . substr $pword, 1;
        }
        $pword;
    } split / +/, $self->english;
    join ' ', @pig_latin_words;
}

1;
