import re

class PigLatin():
    def __init__(self, english):
        self.english = english

    def convert(self):
        pig_latin_words = self.english.split(' ')
        def _convert(word):
            lword = word.lower()
            match = re.search(r'^([^aeiou]*)(.*)$', lword)
            if not match:
                raise Exception('error')
            ay = 'way' if (len(match.group(1)) == 0) else 'ay'
            pword = match.group(2) + match.group(1) + ay
            if (re.search(r'^[A-Z]', word)):
                return pword[0].upper() + pword[1:]
            else:
                return pword
        pig_latin_words = map(_convert, pig_latin_words)
        return ' '.join(pig_latin_words)
