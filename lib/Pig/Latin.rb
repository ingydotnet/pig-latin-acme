class Pig; end
class Pig::Latin
  def initialize buffer
    @buffer = buffer
    @state = 'english'
  end

  def convert
    pig_latin_words = @buffer.split(/ +/).map { |word|
      lword = word.downcase
      m = lword.match(/^([^aeiou]*)(.*)$/) or throw 'error'
      if m[1].length == 0
        ay = 'way'
      else
        ay = 'ay'
      end
      pword = m[2] + m[1] + ay
      if word.match /^[A-Z]/
        pword[0] = pword[0,1].upcase
      end
      pword
    }
    pig_latin_words.join ' '
  end
end
