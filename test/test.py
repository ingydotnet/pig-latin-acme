import sys
sys.path.insert(0, 'lib')
import Pig.Latin

print Pig.Latin.PigLatin('Pig stratin').convert()
print Pig.Latin.PigLatin('I Like Apples').convert()
