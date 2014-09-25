class exports{}Pig.Latin
  (@english) ->

  convert: ->
    pig_latin_words = @english.split(/ +/).map (word)->
      lword = word.toLowerCase!
      [all, consonants, word] = lword.match /^([^aeiou]*)(.*)$/ or
        throw 'error'
      ay = if consonants.length == 0 then 'way' else 'ay'
      pword = word + consonants + ay
      if word.match /^[A-Z]/
        all.toUpperCase! + pword.slice 1
      else
        pword
    pig_latin_words.join ' '
