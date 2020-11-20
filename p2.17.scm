
(define (last-pair lst)
  (cond
    ((null? lst) error)
    ((null? (cdr lst)) lst)
    (else (last-pair (cdr lst)))))

(last-pair (list 1 3 4 5 8 7))

; (load "p2.17.scm")
