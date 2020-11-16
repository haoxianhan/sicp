; 素数

(define (prime? n)
  (= n (small-divisor n)))

(define (small-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= 0 (remainder b a)))







; (load "smallets-divisor.scm")

; (prime? 17)
