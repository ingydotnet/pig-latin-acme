<?php

include_once 'lib/Pig/Latin.php';


$fizz = new PigLatin('Pig latin');
echo $fizz->convert(), "\n";

$bang = new PigLatin('Stringy thingy');
echo $bang->convert(), "\n";

$fizzbang = new PigLatin('I Like Apples');
echo $fizzbang->convert(), "\n";

?>
