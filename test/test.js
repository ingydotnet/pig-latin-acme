Pig = {}
Pig.Latin = require('../lib/Pig/Latin').Pig.Latin

console.log(new Pig.Latin('Pig latin').convert())
console.log(new Pig.Latin('Stringy thingy').convert())
console.log(new Pig.Latin('I Like Apples').convert())

