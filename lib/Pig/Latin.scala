package Pig

case class Latin(text: String) {
	def convert: String = {
		val pattern = """(?i)^([^aeiou]*)(.*)$"""
		val Pattern = pattern.r

		val words = for {
			word <- text.split(" +")
		} yield word.toLowerCase match {
			case Pattern(cons, rest) =>
				val ay = if (cons.isEmpty()) "way" else "ay"
				val pword = rest + cons + ay
				(if (word(0).isUpper) pword.capitalize else pword)
			case _ => throw new IllegalArgumentException(s"Word '${word}' is invalid")
		}
		
		words mkString " "
	}
}
