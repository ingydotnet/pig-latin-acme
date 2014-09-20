class Pig::Latin {
    has $.english;

    method convert {
        my $pig_latin_words = $.english.split(/' '+/).map: -> $word {
            my $lword = $word.lc;
            my $match = $lword ~~ /^(<-[aeiou]>*)(.*)$/
                or die 'error';
            my $ay = $match[0].chars == 0 ?? 'way' !! 'ay';
            my $pword = $match[1] ~ $match[0] ~ $ay;
            if ($word ~~ /^<[A..Z]>/) {
                $pword.substr(0, 1).uc ~ $pword.substr: 1;
            }
            else {
                $pword;
            }
        }
        $pig_latin_words.join: ' ';
    }
}
