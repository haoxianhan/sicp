
(load "utils/stream.scm")

(define (div-stream s1 s2)
  (stream-map / s1 s2))

(define (integrate-series a)
  (mul-stream (div-stream ones integers) a))

; (load "c3/p3.59.scm")
