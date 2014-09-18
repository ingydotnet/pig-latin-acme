#lang racket
(require "../lib/Pig/Latin.rkt")

(define (test english)
  (displayln (send (new pig-latin% [english english]) convert)))

(test "Pig latin")
(test "Stringy thingy")
(test "I Like Apples")
