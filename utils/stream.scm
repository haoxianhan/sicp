; stream's structure inner implement
; (define (cons-stream obj-a obj-b)
;   (cons obj-a (delay obj-b)))

; (define (stream-car stream)
;   (car stream))

; (define (stream-cdr stream)
;   (force (cdr stream)))

; (define the-empty-stream '())

; (define (stream-null? s)
;   (null? s))

; ; memo-proc用于记录是否求值过,避免重复求值
; (define (memo-proc proc)
;   (let ((already-run? false) (result false))
;     (lambda ()
;       (if (not already-run?)
;         (begin
;           (set! already-run? true)
;           (set! result (proc))
;           result)
;         result))))

; (define (delay delay-obj)
;   (memo-proc
;     (lambda () delay-obj)))

; (define (force delay-obj)
;   (delay-obj))

; stream options
(define (stream-ref s n)
  (if (= n 0)
    (stream-car s)
    (stream-ref (stream-cdr s) (- n 1))))

(define (stream-map proc s)
  (if (stream-null? s)
    the-empty-stream
    (cons-stream (proc (stream-car s))
                 (stream-map proc (stream-cdr s)))))

(define (stream-map proc . args)
  (if (stream-null? (car args))
    the-empty-stream
    (cons-stream
      (apply proc (map stream-car args))
      (apply stream-map (cons proc (map stream-cdr args))))))


(define (stream-for-each proc s)
  (if (stream-null? s)
    'done
    (begin
      (proc (stream-car s))
      (stream-for-each proc (stream-cdr s)))))

(define (stream-filter pred s)
  (cond ((stream-null? s) the-empty-stream)
        ((pred (stream-car s)) (cons-stream (stream-car s)
                                            (stream-filter pred (stream-cdr s))))
        (else (stream-filter pred (stream-cdr s)))))

(define (steam-enumerate-interval low high)
  (if (> low high)
    the-empty-stream
    (cons-stream
      low
      (steam-enumerate-interval (+ low 1) high))))

(define (display-stream s)
  (stream-for-each display-line s))

(define (display-line x)
  (newline)
  (display x))


;; 无穷流

; 从1起的自然数
(define (integer-starting-from n)
  (cons-stream n (integer-starting-from (+ n 1))))

(define integers (integer-starting-from 1))


; fibonacci
(define (fibgen a b)
  (cons-stream a (fibgen b (+ a b))))

(define fibs (fibgen 0 1))


; prime
(define (divisible? x y)
  (= (remainder x y) 0))

(define (sieve stream)
  (cons-stream
    (stream-car stream)
    (sieve (stream-filter (lambda (x)
                            (not (divisible? x (stream-car stream))))
                          (stream-cdr stream)))))

(define primes
  (sieve (integer-starting-from 2)))

(stream-ref primes 50)

;; 隐式定义流

; 从1起的自然数
(define ones (cons-stream 1 ones))

(define (add-stream s1 s2)
  (stream-map + s1 s2))

(define integers (cons-stream 1 (add-stream integers ones)))

; fibonacci
(define fibs
  (cons-stream 0
               (cons-stream 1
                            (add-stream fibs (stream-cdr fibs)))))

; 2幂
(define (scale-stream s factor)
  (stream-map (lambda (x) (* x factor)) s))

(define double
  (cons-stream 1 (stream-map double 2)))

; prime
(define primes
  (cons-stream 2
               (stream-filter prime? (integer-starting-from 3))))

(define (prime? n)
  (define (iter ps)
    (cond ((> (square (stream-car ps)) n) true)
          ((divisible? n (stream-car ps)) false)
          (else (iter (stream-cdr ps)))))
  (iter primes)) ; n需要用到的primes必定已生成


; (load "utils/stream.scm")
