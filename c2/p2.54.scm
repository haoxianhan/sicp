

(define (my-equal? a b)
  (cond ((and (symbol? a) (symbol? b))
         (symbol-euqal? a b))
        ((and (list? a) (list? b))
         (list-equal? a b))
        ((and (number? a) (number? b))
         (number-equal? a b))
        (else #f)))

(define (symbol-euqal? a b)
  (eq? a b))

(define (number-equal? a b)
  (eqv? a b))

(define (list-equal? a b)
  (cond ((and (null? a) (null? b))
         #t)
        ((or (null? a) (null? b))
         #f)
        ((my-equal? (car a) (car b))
         (my-equal? (cdr a) (cdr b)))
        (else #f)))


(my-equal? '(1 2 3) '(1 2))

(my-equal? '(1 2 3) '(1 2 3))

(my-equal? '(1) '(1))


; (load "p2.54.scm")
