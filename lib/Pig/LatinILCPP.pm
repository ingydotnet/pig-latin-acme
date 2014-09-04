package Pig::LatinILCPP;

our $VERSION = 0.01;

use Inline CPP => config => namespace => 'Pig';

use Inline
  CPP     => 'DATA';
#  VERSION => '0.01',
#  NAME    => 'Pig::LatinILCPP';

# This should prevent M51 warnings from being generated by Inline if a user
# 'require's Math::Prime::FastSieve instead of 'use'.
END {
    Inline->init();
}

1;

__DATA__
__CPP__

#include <iostream>
#include <string>
#include <vector>
#include <sstream>
#include <algorithm>
#include <iterator>

void ptransform (std::string& s);

class LatinILCPP {
  public:
    LatinILCPP (char* s) :buffer(std::string(s)) {}
    const char* convert();
  private:
    std::string buffer;
};

const char* LatinILCPP::convert () {
  
  // Split on single space, copy to vector named "words".
  std::istringstream iss(buffer);
  std::vector<std::string> words;
  std::copy(
    std::istream_iterator<std::string>(iss),
    std::istream_iterator<std::string>(),
    std::back_inserter(words)
  );

  std::for_each( words.begin(), words.end(), ptransform );

  // Join the words to create the output.
  std::string output = words[0];
  for(
    std::vector<std::string>::iterator it = words.begin() + 1;
    it != words.end();
    ++it
  ) {
    output.append( " " + *it );
  }
    
  return output.c_str();
}

void ptransform ( std::string& s ) {
  std::string word(s);

  // Lower-case the word.
  std::string lword(word);
  std::transform(lword.begin(), lword.end(), lword.begin(), ::tolower );

  // Find where the first 'aeiou' occurs.
  std::size_t pivot = lword.find_first_of("aeiou");

  // Determine the suffix.
  std::string ay;
  if( pivot == 0 ) {
    ay = "way";
  }
  else {
    ay = "ay";
  }
  
  // Configure the piglatin string.
  std::string pword
    = lword.substr(pivot,lword.length()-pivot)
    + lword.substr(0,pivot)
    + ay;

  // Capitalize if necessary.
  if(
    word.find_first_of("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    != std::string::npos
  ) {
    pword.at(0) = toupper(pword.at(0));
  }

  // Set our return value (via param)
  s = pword;
}
