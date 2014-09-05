<?php

include_once 'lib/Pig/Latin.php';

$pig = new Pig\Latin('Pig latin');
echo $pig->convert(), "\n";

$pig = new Pig\Latin('Stringy thingy');
echo $pig->convert(), "\n";

$pig = new Pig\Latin('I Like Apples');
echo $pig->convert(), "\n";

?>
