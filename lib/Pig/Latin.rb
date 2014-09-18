class Pig; end
class Pig::Latin
  def initialize english
    @english = english
  end

  def convert
    pig_latin_words = @english.split(/ +/).map { |word|
      lword = word.downcase
      match = lword.match(/^([^aeiou]*)(.*)$/) or throw 'error'
      ay = match[1].length == 0 ? 'way' : 'ay'
      pword = match[2] + match[1] + ay
      if word.match /^[A-Z]/
        pword[0].upcase + pword[1..-1]
      else
        pword
      end
    }
    pig_latin_words.join ' '
  end
end
