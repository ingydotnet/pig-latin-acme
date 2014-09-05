#include "../lib/Pig/Latin.hpp"

int main() {

  Pig::Latin pig1("Pig latin");
  std::cout << pig1.convert() << "\n";

  Pig::Latin pig2("Stringy thingy");
  std::cout << pig2.convert() << "\n";

  Pig::Latin pig3("I Like Apples");
  std::cout << pig3.convert() << "\n";

  return 0;
}
