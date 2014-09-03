
#ifndef _PIG_LATIN
#define _PIG_LATIN

#include <iostream>
#include <string>
#include <vector>
#include <sstream>
#include <algorithm>
#include <iterator>

namespace Pig {

  void ptransform (std::string& s);

  class Latin {
    public:
      Latin (std::string s) :buffer(s) {}
      std::string convert();
    private:
      std::string buffer;
  };

  std::string Latin::convert () {
    
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
      
    return output;
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

} // End of Pig namespace.

#endif

