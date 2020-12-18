
(define x '((a b) c d))
(define y '(e f))

(define z (cons y x))

(set-car! x y)

(define text1 (cons (list 'a 'b) (list 'a 'b)))
(set-car! (car text1) 'wow)
text1

(define text2-sub (list 'a 'b))
(define text2 (cons text2-sub text2-sub))
(set-car! (car text2) 'wow)
text2



(define (cal-year-income month-add-num year-income-rate year)
  (define month-income-rate (/ year-income-rate 12)) ; 平均月收益率

  (define (print output-all-money)
    (let* ((input-all-money (* year 12 month-add-num))
           (profit (- output-all-money input-all-money)))
      (newline)
      (newline) (display "input year:       ") (display year)
      (newline) (display "input all-money:  ") (display input-all-money)
      (newline) (display "output all-money: ") (display output-all-money)
      (newline) (display "get profit:       ") (display profit)
      (newline) (display "rate:             ") (display (/ profit input-all-money))
      (newline)))

  (define (iter count acc)
    (cond ((= count 0) (print acc))
          (else (iter (- count 1) (+ acc
                                     (* month-income-rate acc)
                                     month-add-num)))))
  (iter (* year 12) 0))

(define month-add-num 1000)     ; 每月定投
(define year-income-rate 0.05)  ; 平均年收益率
(cal-year-income month-add-num year-income-rate 25)

; (load "test.scm")
