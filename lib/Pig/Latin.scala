package Pig

case class Latin(english: String) {
  def convert: String = {
    val re = "^([^aeiou]*)(.*)$".r

    val pigLatinWords = for {
      word <- english.split(" +")
    } yield word.toLowerCase match {
      case re(cons, rest) =>
        val ay = if (cons.isEmpty()) "way" else "ay"
        val pword = rest + cons + ay
        (if (word(0).isUpper) pword.capitalize else pword)
      case _ => throw new Exception("error")
    }
    pigLatinWords mkString " "
  }
}
