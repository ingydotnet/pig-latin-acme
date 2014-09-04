import re

class PigLatin():
    def __init__(self, english):
        self.english = english

    def convert(self):
        pig_latin_words = self.english.split(' ')
        def _convert(word):
            lword = word.lower()
            m = re.search(r'^([^aeiou]*)(.*)$', lword)
            if not m:
                raise Exception('error')
            if (len(m.group(1)) == 0):
                ay = 'way'
            else:
                ay = 'ay'
            pword = m.group(2) + m.group(1) + ay
            if (re.search(r'^[A-Z]', word)):
                pword = pword[0].upper() + pword[1:]
            return pword
        pig_latin_words = map(_convert, pig_latin_words)
        return ' '.join(pig_latin_words)
