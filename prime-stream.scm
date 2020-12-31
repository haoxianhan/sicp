(load "utils/stream.scm")


; 计算出第n个 "个位是1" 的素数
(define ans
  (stream-filter (lambda (x)
                   (= (remainder x 10) 1))
                 primes))

(define (display-proc stream n)
  (unless (= n 0)
    (newline)
    (display (stream-car stream))
    (display-stream (stream-cdr stream) (- n 1))))

; (display-proc ans 1000)

(stream-ref ans 301)


; (load "prime-stream.scm")
