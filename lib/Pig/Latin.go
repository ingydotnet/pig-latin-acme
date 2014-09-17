/*
 * Go port of PigLatin in an OO style.
 */

package PigLatin

import "strings"
import "regexp"

type New struct {
  English string
}

func (self *New) Convert() string {
  pig_latin_words := []string{}
  words := strings.Split(self.English, " ")
  for _, word := range words {
    lword := strings.ToLower(word)
    m := regexp.MustCompile("^([^aeiou]*)(.*)$").FindStringSubmatch(lword)
    ay := ""
    if len(m[1]) == 0 {
      ay = "way"
    } else {
      ay = "ay"
    }
    pword := m[2] + m[1] + ay
    if regexp.MustCompile("^[A-Z]").MatchString(word) {
        pword = strings.ToUpper(pword[0:1]) + pword[1:]
    }
    pig_latin_words = append(pig_latin_words, pword)
  }
  return strings.Join(pig_latin_words, " ")
}
