#lang racket
(require "../lib/Pig/Latin.rkt")

(define (test text)
  (displayln (send (new pig-latin% [text text]) convert)))

(test "Pig latin")
(test "Stringy thingy")
(test "I Like Apples")
