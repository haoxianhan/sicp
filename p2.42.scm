(load "utils/enumerate-interval.scm")
(load "utils/flatmap.scm")

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      (filter
        (lambda (positions) (safe? k positions))
        (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board '())

(define (safe? k positions)
  (safe-p? (car positions) (cdr positions)))

(define (safe-p? p1 positions)
  (define (check-safe? p2)
    (let ((x1 (car p1)) (x2 (car p2))
          (offset (- (cdr p1) (cdr p2))))
      (if (or (= x1 x2)
              (= x1 (+ x2 offset))
              (= x1 (- x2 offset))) #f
        #t)))
  (define (iter rest-pos)
    (cond ((null? rest-pos) #t)
          ((not (check-safe? (car rest-pos))) #f)
          (else (iter (cdr rest-pos)))))
  (iter positions))

(define (adjoin-position new-row k queens)
  (cons (cons new-row k) queens))

(queens 4)

(define (pretty-print n)
  (define (pretty result)
    (display (fold-left (lambda (acc x)
                          (cons (car x) acc))
                        '()
                        result))
    (newline))
  (for-each pretty (queens n)))

(pretty-print 4)

; (load "p2.42.scm")


(car '(a b))

(list 'car (quote (list a b)))
