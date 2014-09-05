#include "../lib/Pig/Latin.hpp"

int main() {


  Pig::Latin pig("Pig latin");
  std::cout << pig.convert() << "\n";

  pig = Pig::Latin("Stringy thingy");
  std::cout << pig.convert() << "\n";

  pig = Pig::Latin("I Like Apples");
  std::cout << pig.convert() << "\n";

  return 0;
}
