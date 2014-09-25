exports.Pig ||= class Pig
exports.Pig.Latin = class Latin
  (@english) ->

  convert: ->
    pig_latin_words = @english.split(/ +/).map (word)->
      lword = word.toLowerCase()
      match_ = lword.match /^([^aeiou]*)(.*)$/ or
        throw 'error'
      ay = if match_[1].length == 0 then 'way' else 'ay'
      pword = match_[2] + match_[1] + ay
      if word.match /^[A-Z]/
        pword[0].toUpperCase() + pword.slice(1)
      else
        pword
    pig_latin_words.join ' '
