<?php

include_once 'lib/Pig/Latin.php';


$fizz = new Pig\Latin('Pig latin');
echo $fizz->convert(), "\n";

$bang = new Pig\Latin('Stringy thingy');
echo $bang->convert(), "\n";

$fizzbang = new Pig\Latin('I Like Apples');
echo $fizzbang->convert(), "\n";

?>
