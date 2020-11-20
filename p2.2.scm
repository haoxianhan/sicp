(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cdr seg))

(define (midpoint-segment seg)
  (let ((star-point (start-segment seg))
        (end-point (end-segment seg)))
    (make-point (average (x-point star-point)
                         (x-point end-point))
                (average (y-point star-point)
                         (y-point end-point)))))



(define (average a b)
  (/ (+ a b) 2.0))


; (load "p2.2.scm")

(define start (make-point 1 3))

(define end (make-point 4 3))

(define seg (make-segment start end))

(define mid (midpoint-segment seg))

(print-point mid)
