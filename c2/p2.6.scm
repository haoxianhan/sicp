

(define zero
  (lambda (f)
    (lambda (x) x)))


(define (add-1 n)
  (lambda (f)
    (lambda (x)
      (f ((n f) x)))))

(add-1 zero)


; (define (plus m n)
;   (lambda (f)
;     (lambda (x)
;       ((m f) ((n f) x)))))

(define plus
  (lambda (m)
    (lambda (n)
      (lambda (f)
        (lambda (x)
          ((m f) ((n f) x)))))))

(define one
  (add-1 zero))

(define two
  (add-1 (add-1 zero)))

((((plus one) two) (lambda (x) (+ x 1))) 0)



(define inc
  (lambda (x)
    (+ x 1)))

(define num0
  ((zero inc) 0))

(define num1
  ((one inc) 0))

(define num2
  (((add-1 one) inc) 0))

; (load "p2.6.scm")
