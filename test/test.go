package main

import "fmt"
import "../lib/Pig/"

func main() {
  p1 := PigLatin.New{English: "Pig latin"}
  fmt.Println(p1.Convert())
  p2 := PigLatin.New{English: "Stringy thingy"}
  fmt.Println(p2.Convert())
  p3 := PigLatin.New{English: "I Like Apples"}
  fmt.Println(p3.Convert())
}
