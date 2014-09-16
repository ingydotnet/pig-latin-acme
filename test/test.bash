set -e
source lib/Pig/Latin.bash

Pig.Latin.new p1 'Pig latin'
echo `p1.convert`
Pig.Latin.new p2 'Stringy thingy'
echo `p2.convert`
Pig.Latin.new p3 'I Like Apples'
echo `p3.convert`
