#lang racket
(provide pig-latin%)

(define (latin-convert english)
  (string-join
    (for/list ([word (string-split english " ")])
      (match-let* ([lword (string-downcase word)]
                   [(list _ match1 match2)
                    (regexp-match #rx"^([^aeiou]*)(.*)$" lword)])
        ;; `l` will be empty for vowels
        (define ay (if (string=? match1 "") "way" "ay"))
        (define pword (string-append match2 match1 ay))
        ;; Restore the first capital (also lower anything else)
        (if (char-upper-case? (first (string->list word)))
            (string-titlecase pword)
            pword)))
    " "))

(define pig-latin%
  (class object% (init english)
    ;; Private field. Racket has field/init-field, but those are public
    (define cur-text english)
    (define/public (convert)
      (latin-convert cur-text))
    (super-new)))
