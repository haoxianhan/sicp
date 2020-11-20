
(define tolerance 0.000001)

(define (fixed-point f first-guess)

  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (try guess step)
    (display-info guess step)
    (let ((next (f guess)))
      (if (close-enough? next guess)
        (begin
          (display-info next (+ 1 step))
          next)
        (try next (+ 1 step)))))

  (try first-guess 1))

(define (display-info guess step)
  (display "Step: ")
  (display step)
  (display " ")
  (display "Guess: ")
  (display guess)
  (newline))

; 普通方法
(define general
  (lambda (x)
    (/ (log 1000)
       (log x))))

; 平均阻尼
(define (zuni-general f)
  (lambda (x)
    (average x (f x))))

(define (average x y)
  (/ (+ x y) 2.0))

; (load "p1.36.scm")

(fixed-point general 2.0)
(fixed-point (zuni-general general) 2.0)
