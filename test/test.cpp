
#include "../lib/Pig/Latin.hpp"


int main() {

  Pig::Latin s1("Pig latin");
  std::cout << s1.convert() << "\n";

  Pig::Latin s2("Stringy thingy");
  std::cout << s2.convert() << "\n";

  Pig::Latin s3("I Like Apples");
  std::cout << s3.convert() << "\n";

  return 0;
}
