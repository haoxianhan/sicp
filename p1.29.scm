; h/3[y0+4y1+2y2+4y3+2y4+⋯+2yn−2+4yn−1+yn]

; 观察公式 [] 中只有首尾是1，其余 偶数项是4， 奇数项是2

(define (simpson f a b n)

  (define h
    (/ (- b a) n))

  (define (y k)
    (f (+ a (* k h))))

  (define (factor k)
    (cond ((or (= 0 k) (= n k))
           1)
          ((odd? k)
           4)
          ((even? k)
           2)))

  (define (term k)
    (* (factor k)
       (y k)))

  (define (next k)
    (+ k 1))


; 前面练习的sample
  (define (sum term a next b)
    (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))


  (if (even? n)
    (* (/ h 3)
       (sum term (exact->inexact 0) next n))
    (error "not even")))


(define (cube x)
  (* x x x))

(simpson cube 0 1 100)
(simpson cube 0 1 1000)

; (load "p1.29.scm")
