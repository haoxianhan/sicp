

(define (cont-frac N D k)

  (define (cal i)
    (if (= i k)
      (/ (N i) (D i))
      (/ (N i) (+ (D i) (cal (+ 1 i))))))

  (cal 1))


(define (golden-ratio k)
  (+ 1
     (cont-frac (lambda (x) 1.0)
                (lambda (x) 1.0)
                k)))

(golden-ratio 10)
(golden-ratio 11)


(define (cont-frac-iter N D k)
  (define (iter i result)
    (if (= i 0)
      result
      (iter (- i 1)
            (/ (N i) (+ (D i) result)))))

  (iter (- k 1)
        (/ (N k) (D k))))



(define (golden-ratio-iter k)
  (+ 1
     (cont-frac-iter (lambda (x) 1.0)
                     (lambda (x) 1.0)
                     k)))

(golden-ratio-iter 11)

; ; (load "p1.37.scm")


