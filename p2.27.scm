(define (reverse lst)
  (define (iter lst1 result)
    (if (null? lst1)
      result
      (iter (cdr lst1) (cons (car lst1) result))))
  (iter lst '()))

(define (deep-reverse lst)
  (cond ((null? lst) '())
        ((not (pair? lst)) lst)
        (else (reverse (map deep-reverse lst)))))


(define x (list (list 1 (list 2 6)) (list 3 4 5)))

(deep-reverse x)

; (load "p2.27.scm")
