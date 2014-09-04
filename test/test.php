<?php

class Latin {

  private $english;

  public function __construct($eng) { $this->english = $eng; }

  public function convert() {
    
    $callback = function($word) {

      $lword = strtolower($word);

      if( ! preg_match( '/^([^aeiou]*)(.*)$/', $lword, $matches ) ) {
        throw new Exception('error');
      }
      
      if( strlen($matches[1]) == 0 ) {
        $ay = 'way';
      }
      else {
        $ay = 'ay';
      }

      $pword = $matches[2] . $matches[1] . $ay;

      if( preg_match( '/^[A-Z]/', $word ) ) {
        $pword = strtoupper( substr( $pword, 0, 1 ) ) . substr( $pword, 1 );
      }

      return $pword;
    };

    $pig_latin_words
      = array_map( $callback, preg_split( '/\ +/', $this->english ) );

    return join( ' ', $pig_latin_words );
    
  }

}



$fizz = new Latin('Pig latin');
echo $fizz->convert(), "\n";

$bang = new Latin('Stringy thingy');
echo $bang->convert(), "\n";

$fizzbang = new Latin('I Like Apples');
echo $fizzbang->convert(), "\n";

?>
