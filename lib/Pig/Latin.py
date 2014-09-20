import re

class PigLatin():
  def __init__(self, english):
    self.english = english

  def convert(self):
    def _1(word):
      lword = word.lower()
      match = re.search(r'^([^aeiou]*)(.*)$', lword)
      if not match:
        raise Exception('error')
      ay = 'way' if len(match.group(1)) == 0 else 'ay'
      pword = match.group(2) + match.group(1) + ay
      if re.search(r'^[A-Z]', word):
        return pword[0].upper() + pword[1:]
      else:
        return pword
    pig_latin_words = map(_1, self.english.split(' '))
    return ' '.join(pig_latin_words)
