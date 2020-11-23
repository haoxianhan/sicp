
(define (same-parity h . t)
  (find (if (even? h)
          even?
          odd?)
        (cons h t)))

(define (find odd-even? lst)
  (cond ((null? lst) '())
        ((odd-even? (car lst))
         (cons (car lst) (find odd-even? (cdr lst))))
        (else
          (find odd-even? (cdr lst)))))

(same-parity 1 2 3 4 5 6 7)
(same-parity 0 2 3 4 5 6 7)


; (load "p2.20.scm")
