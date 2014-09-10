package Pig

object Test {
  def main(args: Array[String]) {
    println(Latin("Pig latin").convert)
    println(Latin("Stringy thingy").convert)
    println(Latin("I like Apples").convert)
  }
}
