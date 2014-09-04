<?php

class Latin {

  private $english;

  
  public function __construct() {
    $this->english = func_get_arg( func_num_args() == 2 ? 1 : 0 );
//    print $this->english;
  }

  public function convert() {
    
    $callback = function($word) {
      $lword = strtolower($word);
      if( ! preg_match('/^([^aeiou]*)(.*)$/', $lword, $matches ) ) {
        throw new Exception('error');
      }
      $ay = '';
      
      if( strlen($matches[1]) == 0 ) {
        $ay = 'way';
      }
      else {
        $ay = 'ay';
      }
      $pword = $matches[2] . $matches[1] . $ay;
      if( preg_match('/^[A-Z]/', $word ) ) {
        $pword = strtoupper(substr($pword,0,1)) . substr($pword, 1);
      }
      return $pword;
    };

    $pig_latin_words
      = array_map( $callback, preg_split('/\ +/', $this->english ) );
    return join(" ", $pig_latin_words );
    
  }

}

$bar = new Latin("english", "Pig latin");
echo $bar->convert(), "\n";
$baz = new Latin("Stringy thingy");
echo $baz->convert(), "\n";
$bum = new Latin("I Like Apples");
echo $bum->convert(), "\n";

?>