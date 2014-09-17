package main

import "fmt"
import "../lib/Pig/"

func main() {
  p1 := PigLatin.New{English: "Pig latin"}
  fmt.Println(PigLatin.Convert(p1))
  p2 := PigLatin.New{English: "Stringy thingy"}
  fmt.Println(PigLatin.Convert(p2))
  p3 := PigLatin.New{English: "I Like Apples"}
  fmt.Println(PigLatin.Convert(p3))
}
