class Pig::Latin {
    has $.english;

    method convert {
        my $pig_latin_words = $.english.split(' ').map( -> $word {
            my $lword = $word.lc;
            $lword ~~ /^(<-[aeiou]>*)(.*)$/ or die 'error';
            my $ay;
            if $0.chars == 0 {
                $ay = 'way';
            }
            else {
                $ay = 'ay';
            }
            my $pword = $1 ~ $0 ~ $ay;
            if ($word ~~ /^<[A..Z]>/) {
                $pword = $pword.substr(0, 1).uc ~ $pword.substr(1);
            }
            $pword;
        });
        $pig_latin_words.join(' ');
    }
}
