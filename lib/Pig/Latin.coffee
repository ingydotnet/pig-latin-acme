exports.Pig ||= class Pig
exports.Pig.Latin = class Latin
  constructor: (@buffer) ->

  convert: ->
    pig_latin_words = @buffer.split(/\ +/).map (word)->
      lword = word.toLowerCase()
      m = lword.match /^([^aeiou]*)(.*)$/ or throw 'error'
      if m[1].length == 0
        ay = 'way'
      else
        ay = 'ay'
      pword = m[2] + m[1] + ay
      if word.match /^[A-Z]/
        pword = pword[0].toUpperCase() + pword[1..-1]
      pword
    pig_latin_words.join ' '
