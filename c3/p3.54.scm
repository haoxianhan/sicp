
(load "utils/stream.scm")

(define (mul-stream s1 s2)
  (stream-map * s1 s2))

; 阶乘
(define factorials
  (cons-stream 1 (mul-stream factorials (stream-cdr integers))))

(stream-ref factorials 4)

; (load "c3/p3.54.scm")
