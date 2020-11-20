
(define (reverse lst)
  (define (iter lst1 result)
    (if (null? lst1)
      result
      (iter (cdr lst1) (cons (car lst1) result))))
  (iter lst '()))



(reverse (list 1 3 4 5 8 8))

; (load "p2.18.scm")
