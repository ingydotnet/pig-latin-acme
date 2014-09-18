<?php

namespace Pig {
  class Latin {
    private $english;

    public function __construct($english) {
      $this->english = $english;
    }

    public function convert() {

      $callback = function($word) {
        $lword = strtolower($word);
        if (! preg_match( '/^([^aeiou]*)(.*)$/', $lword, $match)) {
          throw new Exception('error');
        }
        $ay = (strlen($match[1]) == 0) ? 'way' : 'ay';
        $pword = $match[2] . $match[1] . $ay;
        if (preg_match( '/^[A-Z]/', $word)) {
          return strtoupper(substr($pword, 0, 1)) . substr($pword, 1);
        }
        else {
          return $pword;
        }
      };

      $pig_latin_words = array_map(
        $callback,
        preg_split('/\ +/', $this->english)
      );
      return join(' ', $pig_latin_words);
    }
  }
}

?>
