Pig = {}
Pig.Latin = require('../lib/Pig/Latin').Pig.Latin

console.log(new Pig.Latin('Pig stratin').convert())
console.log(new Pig.Latin('I Like Apples').convert())

