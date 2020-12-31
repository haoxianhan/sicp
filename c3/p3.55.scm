
(load "utils/stream.scm")

; Define a procedure partial-sums that takes as argument a stream S and returns the stream whose elements are S0, S0+S1, S0+S1+S2, . . .. For example, (partial-sums integers) should be the stream 1, 3, 6, 10, 15, . . ..

(define (partial-sums s)
  (cons-stream (stream-car s)
               (add-stream (partial-sums s) (stream-cdr s))))

(stream-ref (partial-sums integers) 5)

; (load "c3/p3.55.scm")
