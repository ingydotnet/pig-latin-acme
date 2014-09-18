package Pig

case class Latin(english: String) {
  def convert: String = {
    val pigLatinWords = english.split(" +").map(word => {
      val lword = word.toLowerCase

      val re = "^([^aeiou]*)(.*)$".r
      val match_ = lword match {
        case re(m1, m2) => List(m1, m2)
        case _ => throw new Exception("error")
      }

      val ay = if (match_(0).isEmpty()) "way" else "ay"
      val pword = match_(1) + match_(0) + ay
      if (word(0).isUpper)
        pword.capitalize
      else
        pword
    })
    pigLatinWords mkString " "
  }
}
