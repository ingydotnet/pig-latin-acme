import qualified Pig.Latin

main = do
  putStrLn $ Pig.Latin.convert $ Pig.Latin.PigLatin "Pig latin"
  putStrLn $ Pig.Latin.convert $ Pig.Latin.PigLatin "Stringy thingy"
  putStrLn $ Pig.Latin.convert $ Pig.Latin.PigLatin "I Like Apples"
