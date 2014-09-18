#lang racket
(provide pig-latin%)

(define (latin-convert text)
  (string-join
   (for/list ([word (string-split text " ")])
     (match-let ([(list _ l w) (regexp-match #rx"^([^aeiou]*)(.*)$" word)])
       (displayln (string-append "l " l))
       (define pword (string-append w l
                                    (if (string=? l "") "way" "ay")))
       (if (char-upper-case? (first (string->list word))) ;; `l` will be empty for vowels
           (string-titlecase pword) ;; restore the first capital (also lower anything else)
           pword)))
   " "))

(define pig-latin%
  (class object% (init text)
    (define cur-text text) ;; private field. Racket has field/init-field, but those are public
    (define/public (convert)
      (latin-convert cur-text))
    (super-new)))


