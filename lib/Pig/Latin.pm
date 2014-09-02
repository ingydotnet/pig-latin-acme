package Pig::Latin;
use Moose;

has buffer => (is => 'ro');

sub convert {
    my ($self) = @_;
    my @pig_latin_words = map {
        my $word = $_;
        my $lword = lc($word);
        $lword =~ /^([^aeiou]*)(.*)$/;
        my $ay;
        if (length($1) == 0) {
            $ay = 'way';
        }
        else {
            $ay = 'ay';
        }
        my $pword = $2 . $1 . $ay;
        if ($word =~ /^[A-Z]/) {
            $pword = ucfirst($pword);
        }
        $pword;
    } split / +/, $self->buffer;
    join ' ', @pig_latin_words;
}

1;
