

(define (cc amount coins-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0)
             (no-more? coins-values)) 0)
        (else
          (+ (cc amount (except-first-denomination coins-values))
             (cc (- amount (first-denomination coins-values)) coins-values)))))

(define (no-more? coins-values)
  (null? coins-values))

(define (first-denomination coins-values)
  (car coins-values))

(define (except-first-denomination coins-values)
  (cdr coins-values))



; (load "p2.19.scm")
