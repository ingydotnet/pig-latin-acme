exports.Pig ||= class Pig
exports.Pig.Latin = class Latin
  constructor: (@english) ->

  convert: ->
    pig_latin_words = @english.split(/\ +/).map (word)->
      lword = word.toLowerCase()
      match = lword.match /^([^aeiou]*)(.*)$/ or
        throw 'error'
      ay = if match[1].length == 0 then 'way' else 'ay'
      pword = match[2] + match[1] + ay
      if word.match /^[A-Z]/
        pword[0].toUpperCase() + pword[1..-1]
      else
        pword
    pig_latin_words.join ' '
