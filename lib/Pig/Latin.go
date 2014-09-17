package PigLatin

import "strings"
import "regexp"

type New struct {
  English string
}

func Convert(self New) string {
  pig_latin_words := []string{}
  words := strings.Split(self.English, " ")
  for _, word := range words {
    lword := strings.ToLower(word)
    re := regexp.MustCompile("^([^aeiou]*)(.*)$")
    m := re.FindStringSubmatch(lword)
    ay := ""
    if len(m[1]) == 0 {
      ay = "way"
    } else {
      ay = "ay"
    }
    pword := m[2] + m[1] + ay
    re2 := regexp.MustCompile("^[A-Z]")
    m2 := re2.MatchString(word)
    if m2 {
        pword = strings.ToUpper(pword[0:1]) + pword[1:]
    }
    pig_latin_words = append(pig_latin_words, pword)
  }
  return strings.Join(pig_latin_words, " ")
}
