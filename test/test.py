import sys
sys.path.insert(0, 'lib')
import Pig.Latin

print Pig.Latin.PigLatin('Pig latin').convert()
print Pig.Latin.PigLatin('Stringy thingy').convert()
print Pig.Latin.PigLatin('I Like Apples').convert()
