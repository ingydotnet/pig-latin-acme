package Pig::Latin;
use Mo;

has english => ();

sub convert {
    my ($self) = @_;
    my @pig_latin_words = map {
        my $word = $_;
        my $lword = lc($word);
        $lword =~ /^([^aeiou]*)(.*)$/
            or die 'error';
        my $ay = length($1) == 0 ? 'way' : 'ay';
        my $pword = $2 . $1 . $ay;
        if ($word =~ /^[A-Z]/) {
            uc(substr $pword, 0, 1) . substr $pword, 1;
        }
        else {
            $pword;
        }
    } split / +/, $self->english;
    join ' ', @pig_latin_words;
}

1;
