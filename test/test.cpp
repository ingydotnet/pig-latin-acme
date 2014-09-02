
#include "../lib/Pig/Latin.hpp"


int main() {

  Pig::Latin p("Pig stratin");
  std::cout << p.convert() << "\n";

  Pig::Latin q("I Like Apples");
  std::cout << q.convert() << "\n";
  
  return 0;
}
