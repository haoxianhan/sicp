
(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (car n)
  (define (iter n c)
    (if (= (remainder n 2) 0)
      (iter (/ n 2) (+ c 1))
      c))
  (iter n 0))


(define (cdr n)
  (define (iter n c)
    (if (= (remainder n 3) 0)
      (iter (/ n 3) (+ c 1))
      c))
  (iter n 0))

; (load "p2.5.scm")

(cons 1 2)

(car (cons 1 2))

(cdr (cons 1 3))
