
(define (accumulate combiner null-value term a next b)
  (define (stop? a b)
    (> a b))

  (if (stop? a b)
    null-value
    (combiner (term a)
              (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))


(define (product term a next b)
  (accumulate * 1 term a next b))


; 尾递归
(define (accumulate-tail combiner null-value term a next b)
  (define (stop? a b)
    (> a b))

  (define (iter a result)
    (if (stop? a b)
      null-value
      (iter (next a) (combiner result (term a)))))

  (iter a null-value))


; (sum (lambda (x) x)
;      0
;      (lambda (x) (+ 1 x))
;      10)

; (product (lambda (x) x)
;          1
;          (lambda (x) (+ 1 x))
;          5)

; (load "p1.32.scm")
